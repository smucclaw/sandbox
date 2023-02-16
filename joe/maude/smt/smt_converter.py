#
# Extension of the Maude SMT support for other theories (Z3 version)
#


import z3 as smt


class SMTConverter:
	"""Convert Maude terms to SMT-LIB"""

	def __init__(self, module):
		self.module = module
		self.ops_table = {}
		self.sorts_table = {}

		self.boolean_sort = None
		self.integer_sort = None
		self.real_sort = None
		self.intlit_symb = None
		self.reallit_symb = None

		self.load()

	def load(self):
		"""Find the symbols for the SMT operators"""

		self.load_boolean()
		self.load_integer()
		self.load_real()
		self.load_real_integer()

		self.sorts_table[self.boolean_sort] = smt.BoolSort()
		self.sorts_table[self.integer_sort] = smt.IntSort()
		self.sorts_table[self.real_sort] = smt.RealSort()

	def load_boolean(self):
		self.boolean_sort = self.module.findSort('Boolean')
		boolk = self.boolean_sort.kind()

		b = smt.BoolRef

		boolean_ops = [
			('true', 0, lambda: smt.BoolVal(True)),
			('false', 0, lambda: smt.BoolVal(False)),
			('not_', 1, smt.Not),
			('_and_', 2, smt.And),
			('_xor_', 2, smt.Xor),
			('_or_', 2, smt.Or),
			('_implies_', 2, smt.Implies),
			('_===_', 2, b.__eq__),
			('_=/==_', 2, b.__ne__),
			('_?_:_', 3, smt.If)
		]

		for name, arity, target in boolean_ops:
			symb = self.module.findSymbol(name, [boolk] * arity, boolk)
			if symb is None:
				raise ValueError(f'cannot find {name} Boolean symbol')
			self.ops_table[symb] = target

	def load_integer(self):
		self.integer_sort = self.module.findSort('Integer')

		kinds = [self.boolean_sort.kind(), self.integer_sort.kind()]

		a = smt.ArithRef

		integer_ops = [
			('-_', [1], 1, a.__neg__),
			('_+_', [1, 1], 1, a.__add__),
			('_*_', [1, 1], 1, a.__mul__),
			('_-_', [1, 1], 1, a.__sub__),
			('_div_', [1, 1], 1, a.__div__),
			('_mod_', [1, 1], 1, a.__mod__),
			('_<_', [1, 1], 0, a.__lt__),
			('_<=_', [1, 1], 0, a.__le__),
			('_>_', [1, 1], 0, a.__gt__),
			('_>=_', [1, 1], 0, a.__ge__),
			('_===_', [1, 1], 0, a.__eq__),
			('_=/==_', [1, 1], 0, a.__ne__),
			('_?_:_', [0, 1, 1], 1, smt.If)
		]

		for name, domain, rtype, target in integer_ops:
			symb = self.module.findSymbol(name, [kinds[k] for k in domain], kinds[rtype])
			if symb is None:
				raise ValueError(f'cannot find {name} integer symbol')
			self.ops_table[symb] = target

		self.intlit_symb = self.module.findSymbol('<Integers>', [], self.integer_sort.kind())

	def load_real(self):
		self.real_sort = self.module.findSort('Real')

		kinds = [self.boolean_sort.kind(), self.real_sort.kind()]

		a = smt.ArithRef

		real_ops = [
			('-_', [1], 1, a.__neg__),
			('_+_', [1, 1], 1, a.__add__),
			('_*_', [1, 1], 1, a.__mul__),
			('_-_', [1, 1], 1, a.__sub__),
			('_/_', [1, 1], 1, a.__div__),
			('_<_', [1, 1], 0, a.__lt__),
			('_<=_', [1, 1], 0, a.__le__),
			('_>_', [1, 1], 0, a.__gt__),
			('_>=_', [1, 1], 0, a.__ge__),
			('_===_', [1, 1], 0, a.__eq__),
			('_=/==_', [1, 1], 0, a.__ne__),
			('_?_:_', [0, 1, 1], 1, smt.If)
		]

		for name, domain, rtype, target in real_ops:
			symb = self.module.findSymbol(name, [kinds[k] for k in domain], kinds[rtype])
			if symb is None:
				raise ValueError(f'cannot find {name} real symbol')
			self.ops_table[symb] = target

		self.reallit_symb = self.module.findSymbol('<Reals>', [], self.real_sort.kind())

	def load_real_integer(self):
		kinds = [self.boolean_sort.kind(), self.integer_sort.kind(), self.real_sort.kind()]

		real_integer_ops = [
			('toReal', [1], 2, smt.ToReal),
			('toInteger', [2], 1, smt.ToInt),
			('isInteger', [2], 0, smt.IsInt)
		]

		for name, domain, rtype, target in real_integer_ops:
			symb = self.module.findSymbol(name, [kinds[k] for k in domain], kinds[rtype])
			if symb is None:
				raise ValueError(f'cannot find {name} real-integer symbol')
			self.ops_table[symb] = target

	def _parse_array_type(self, type_name):
		params = type_name[6:-1]

		# There may be parameterized views, so there may
		# be more than a comma in the typename
		comma_pos = 0
		level = 0

		for c in params:
			if c == ',' and level == 0:
				break
			if c == '{':
				level += 1
			elif c == '}':
				level -= 1

			comma_pos += 1

		key_type = self._smt_sort(self.module.findSort(params[:comma_pos]))
		value_type = self._smt_sort(self.module.findSort(params[comma_pos+1:]))

		return smt.ArraySort(key_type, value_type)

	def _smt_sort(self, sort):
		"""Correspondence between Maude and SMT sorts"""

		smt_sort = self.sorts_table.get(sort)

		if smt_sort is not None:
			return smt_sort

		# Array sort (if renamed or if the view names do not coincide
		# with the name of the sorts, it must be introduced manually
		# into sorts_table)
		if str(sort).startswith('Array{'):
			smt_sort = self._parse_array_type(str(sort))

		# Custom sort
		else:
			smt_sort = smt.DeclareSort(str(sort))

		self.sorts_table[sort] = smt_sort
		return smt_sort

	def _make_fnsymb(self, symbol):
		domain = [self._smt_sort(sort) for sort in symbol.getOpDeclarations()[0].getDomainAndRange()]

		return smt.Function(str(symbol), *domain)

	def _make_function(self, symbol):
		symb = self._make_fnsymb(symbol)
		self.ops_table[symbol] = symb
		return symb

	def _make_polymorph(self, symbol):
		symbol_name = str(symbol)

		a = smt.ArrayRef

		polymorph_ops = {
			'forall_._': lambda x, y: smt.ForAll([x], y),
			'exists_._': lambda x, y: smt.Exists([x], y),
			# Not really polymorph, but parameterized
			'_`[_`]': smt.Select,
			'_`[_->_`]': smt.Store,
			'_===_': a.__eq__,
			'_=/==_': a.__ne__,
			'_?_:_': smt.If
		}

		symb = polymorph_ops.get(symbol_name)

		# Add it to the table for reuse
		if symb is not None:
			self.ops_table[symbol] = symb

		return symb

	def translate(self, term):
		"""Translate a Maude term into an SMT formula"""

		symbol = term.symbol()

		# Variable
		if str(symbol) == str(term.getSort()):
			return smt.Const(str(term), self._smt_sort(term.getSort()))
		# Integer constant
		elif symbol == self.intlit_symb:
			return smt.IntVal(int(term))
		# Real constant
		elif symbol == self.reallit_symb:
			return smt.RealVal(float(term))
		# Other symbols
		else:
			symb = self.ops_table.get(symbol)

			# If the symbol is not in the table, it may be a
			# polymorph for a custom type...
			if symb is None:
				symb = self._make_polymorph(symbol)

				# ...or an uninterpreted function
				if symb is None:
					symb = self._make_function(symbol)

			return symb(*[self.translate(arg) for arg in term.arguments()])

