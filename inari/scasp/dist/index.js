/**
 * Module exports
 */
export { GFGrammar, GFAbstract, GFConcrete, Fun, Type, Apply, Coerce, PArg, Const, CncFun, SymCat, SymKS, SymKP, SymLit, Alt, fromJSON };
/**
 * Convert from PGF JSON format into GFGrammar object
 */
function fromJSON(json) {
    return GFGrammar.fromJSON(json);
}
/**
 * A GF grammar is one abstract and multiple concretes
 */
class GFGrammar {
    constructor(abstract, concretes) {
        this.abstract = abstract;
        this.concretes = concretes;
    }
    static fromJSON(json) {
        let cncs = mapObject(json.concretes, (c) => GFConcrete.fromJSON(c));
        return new GFGrammar(GFAbstract.fromJSON(json.abstract), cncs);
    }
    translate(input, fromLang, toLang) {
        let outputs = {};
        let fromConcs = this.concretes;
        if (fromLang) {
            fromConcs = {};
            fromConcs[fromLang] = this.concretes[fromLang];
        }
        let toConcs = this.concretes;
        if (toLang) {
            toConcs = {};
            toConcs[toLang] = this.concretes[toLang];
        }
        for (let c1 in fromConcs) {
            let concrete = this.concretes[c1];
            let trees = concrete.parseString(input, this.abstract.startcat);
            if (trees.length > 0) {
                outputs[c1] = [];
                for (let i in trees) {
                    outputs[c1][i] = {};
                    for (let c2 in toConcs) {
                        outputs[c1][i][c2] = this.concretes[c2].linearize(trees[i]);
                    }
                }
            }
        }
        return outputs;
    }
}
/**
 * Abstract Syntax Tree
 */
class Fun {
    constructor(name, ...args) {
        this.name = name;
        this.args = [];
        for (let i = 1; i < args.length; i++) {
            this.args[i - 1] = args[i];
        }
    }
    print() {
        return this.show(0);
    }
    show(prec) {
        if (this.isMeta()) {
            if (isUndefined(this.type)) {
                return '?';
            }
            else {
                let s = '?:' + this.type;
                if (prec > 0) {
                    s = '(' + s + ')';
                }
                return s;
            }
        }
        else {
            let s = this.name;
            let cs = this.args;
            for (let i in cs) {
                s += ' ' + (isUndefined(cs[i]) ? 'undefined' : cs[i].show(1));
            }
            if (prec > 0 && cs.length > 0) {
                s = '(' + s + ')';
            }
            return s;
        }
    }
    getArg(i) {
        return this.args[i];
    }
    setArg(i, c) {
        this.args[i] = c;
    }
    isMeta() {
        return this.name == '?';
    }
    isComplete() {
        if (this.isMeta()) {
            return false;
        }
        else {
            for (let i in this.args) {
                if (!this.args[i].isComplete()) {
                    return false;
                }
            }
            return true;
        }
    }
    isLiteral() {
        return (/^[\"\-\d]/).test(this.name);
    }
    isString() {
        return (/^\".*\"$/).test(this.name);
    }
    isInt() {
        return (/^\-?\d+$/).test(this.name);
    }
    isFloat() {
        return (/^\-?\d*(\.\d*)?$/).test(this.name) && this.name != '.' && this.name != '-.';
    }
    isEqual(obj) {
        if (this.name != obj.name)
            return false;
        for (let i in this.args) {
            if (!this.args[i].isEqual(obj.args[i]))
                return false;
        }
        return true;
    }
}
/**
 * Abstract syntax
 */
class GFAbstract {
    constructor(startcat, types) {
        this.startcat = startcat;
        this.types = types;
    }
    static fromJSON(json) {
        let typs = mapObject(json.funs, (fun) => {
            return new Type(fun.args, fun.cat);
        });
        return new GFAbstract(json.startcat, typs);
    }
    addType(fun, args, cat) {
        this.types[fun] = new Type(args, cat);
    }
    getArgs(fun) {
        return this.types[fun].args;
    }
    getCat(fun) {
        return this.types[fun].cat;
    }
    // Annotate (only) meta variables
    annotate(tree, type) {
        let typ = this.types[tree.name];
        if (tree.isMeta()) {
            tree.type = type;
        }
        else if (!isUndefined(typ)) {
            for (let i in tree.args) {
                this.annotate(tree.args[i], typ.args[i]);
            }
        }
        return tree;
    }
    handleLiterals(tree, type) {
        if (tree.name != '?') {
            if (type == 'String' || type == 'Int' || type == 'Float') {
                tree.name = type + '_Literal_' + tree.name;
            }
            else {
                let typ = this.types[tree.name];
                for (let i in tree.args) {
                    this.handleLiterals(tree.args[i], typ.args[i]);
                }
            }
        }
        return tree;
    }
    // Hack to get around the fact that our SISR doesn't build real Fun objects.
    copyTree(x) {
        let t = new Fun(x.name);
        if (!isUndefined(x.type)) {
            t.type = x.type;
        }
        let cs = x.args;
        if (!isUndefined(cs)) {
            for (let i = 0; i < cs.length; i++) {
                t.setArg(i, this.copyTree(cs[i]));
            }
        }
        return t;
    }
    parseTree(str, type) {
        let pt = this.parseTree_(str.match(/[\w\u00C0-\u00FF\'\.\"]+|\(|\)|\?|\:/g) || [], 0);
        return pt ? this.annotate(pt, type) : null;
    }
    parseTree_(tokens, prec) {
        if (tokens.length == 0 || tokens[0] == ')') {
            return null;
        }
        let t = tokens.shift();
        if (!t)
            return null;
        if (t == '(') {
            let tree = this.parseTree_(tokens, 0);
            tokens.shift();
            return tree;
        }
        else if (t == '?') {
            // let tree = this.parseTree_(tokens, 0)
            return new Fun('?');
        }
        else {
            let tree = new Fun(t);
            if (prec == 0) {
                let c;
                let i;
                for (i = 0; (c = this.parseTree_(tokens, 1)) !== null; i++) {
                    tree.setArg(i, c);
                }
            }
            return tree;
        }
    }
}
/**
 * Type
 */
class Type {
    constructor(args, cat) {
        this.args = args;
        this.cat = cat;
    }
}
/**
 * Concrete syntax
 */
class GFConcrete {
    constructor(flags, productions, functions, sequences, startCats, totalFIds) {
        this.flags = flags;
        // this.productions = productions
        this.functions = functions;
        // this.sequences   = sequences
        this.startCats = startCats;
        this.totalFIds = totalFIds;
        this.pproductions = productions;
        this.lproductions = {};
        for (let fid0 in productions) {
            let fid = parseInt(fid0);
            for (let i in productions[fid]) {
                let rule = productions[fid][i];
                if (rule.id == 'Apply') {
                    rule = rule;
                    let fun = this.functions[rule.fun];
                    let lproductions = this.lproductions;
                    rule.fun = fun;
                    let register = function (args, key, i) {
                        if (i < args.length) {
                            let c = 0;
                            let arg = args[i].fid;
                            for (let k in productions[arg]) {
                                let rule = productions[arg][k];
                                if (rule.id == 'Coerce') {
                                    rule = rule;
                                    register(args, key + '_' + rule.arg, i + 1);
                                    c++;
                                }
                            }
                            if (c == 0) {
                                register(args, key + '_' + arg, i + 1);
                            }
                        }
                        else {
                            let set = lproductions[key];
                            if (set == null) {
                                set = [];
                                lproductions[key] = set;
                            }
                            set.push({ fun: fun, fid: fid });
                        }
                    };
                    register(rule.args, rule.fun.name, 0);
                }
            }
        }
        for (let fun of functions) {
            for (let j in fun.lins) {
                fun.lins[j] = sequences[fun.lins[j]];
            }
        }
    }
    static fromJSON(json) {
        // TODO check keys string/number
        let prods = mapObject(json.productions, (prods) => {
            return prods
                .map((prod) => productionFromJSON(prod))
                .filter((x) => x !== null);
        });
        let funs = json.functions.map((fun) => {
            return new CncFun(fun.name, fun.lins);
        });
        let seqs = json.sequences.map((syms) => {
            return syms
                .map((sym) => symFromJSON(sym))
                .filter((x) => x !== null);
        });
        let cats = mapObject(json.categories, (cat) => {
            return { s: cat.start, e: cat.end };
        });
        let fids = json.totalfids;
        return new GFConcrete(json.flags, prods, funs, seqs, cats, fids);
    }
    linearizeSyms(tree, tag) {
        let res = [];
        if (tree.isString()) {
            let sym = new SymKS(tree.name);
            sym.tag = tag;
            res.push({ fid: -1, table: [[sym]] });
        }
        else if (tree.isInt()) {
            let sym = new SymKS(tree.name);
            sym.tag = tag;
            res.push({ fid: -2, table: [[sym]] });
        }
        else if (tree.isFloat()) {
            let sym = new SymKS(tree.name);
            sym.tag = tag;
            res.push({ fid: -3, table: [[sym]] });
        }
        else if (tree.isMeta()) {
            // TODO: Use lindef here
            let cat = this.startCats[tree.type];
            let sym = new SymKS(tree.name);
            sym.tag = tag;
            for (let fid = cat.s; fid <= cat.e; fid++) {
                res.push({ fid: fid, table: [[sym]] });
            }
        }
        else {
            let cs = [];
            for (let i in tree.args) {
                // TODO: we should handle the case for nondeterministic linearization
                cs.push(this.linearizeSyms(tree.args[i], tag + '-' + i)[0]);
            }
            let key = tree.name;
            for (let i in cs) {
                if (isUndefined(cs[i])) {
                    // Some arguments into this function are undefined
                    console.warn(`${tree.args[i].name} is undefined`);
                    return [{
                            fid: -5,
                            table: [[new SymKS(`[${tree.name}]`).tagWith(tag)]]
                        }];
                }
                else if (cs[i].fid === -5) {
                    // My child cannot lin properly, just find first matching rule for me
                    // TODO probably not general enough
                    for (let k in this.lproductions) {
                        if (k.includes(tree.name)) {
                            key = k;
                            break;
                        }
                    }
                    break;
                }
                else {
                    key = key + '_' + cs[i].fid;
                }
            }
            for (let i in this.lproductions[key]) {
                let rule = this.lproductions[key][i];
                let row = {
                    fid: rule.fid,
                    table: []
                };
                for (let j in rule.fun.lins) {
                    let lin = rule.fun.lins[j];
                    let toks = [];
                    row.table[j] = toks;
                    lin.forEach((sym0) => {
                        switch (sym0.id) {
                            case 'Arg':
                            case 'Lit': {
                                let sym = sym0;
                                let ts = cs[sym.i].table[sym.label];
                                for (let l in ts) {
                                    toks.push(ts[l]);
                                }
                                break;
                            }
                            case 'KS':
                            case 'KP': {
                                let sym = sym0;
                                toks.push(sym.tagWith(tag));
                                break;
                            }
                        }
                    });
                }
                res.push(row);
            }
        }
        return res;
    }
    syms2toks(syms) {
        let ts = [];
        for (let i = 0; i < syms.length; i++) {
            let sym0 = syms[i];
            switch (sym0.id) {
                case 'KS': {
                    let sym = sym0;
                    for (let j in sym.tokens) {
                        ts.push(new TaggedString(sym.tokens[j], sym.tag));
                    }
                    break;
                }
                case 'KP': {
                    let sym = sym0;
                    let addedAlt = false;
                    if (i < syms.length - 1) {
                        let nextSym = syms[i + 1];
                        if (nextSym.id == 'KS') {
                            let nextToken = nextSym.tokens[0];
                            sym.alts.forEach((alt) => {
                                // consider alts here (for handling pre)
                                if (alt.prefixes.some((p) => nextToken.startsWith(p))) {
                                    alt.tokens.forEach((symks) => {
                                        symks.tokens.forEach((t) => {
                                            ts.push(new TaggedString(t, sym.tag));
                                        });
                                    });
                                    addedAlt = true;
                                    return;
                                }
                            });
                        }
                    }
                    if (addedAlt)
                        break;
                    // Fall through here when no alts (or none apply)
                    sym.tokens.forEach((symks) => {
                        symks.tokens.forEach((t) => {
                            ts.push(new TaggedString(t, sym.tag));
                        });
                    });
                    break;
                }
            }
        }
        return ts;
    }
    linearizeAll(tree) {
        return this.linearizeSyms(tree, '0').map((r) => {
            return this.unlex(this.syms2toks(r.table[0]));
        });
    }
    linearize(tree) {
        let res = this.linearizeSyms(tree, '0');
        if (res.length > 0)
            return this.unlex(this.syms2toks(res[0].table[0]));
        else
            return '';
    }
    tagAndLinearize(tree) {
        let res = this.linearizeSyms(tree, '0');
        if (res.length > 0)
            return this.syms2toks(res[0].table[0]);
        else
            return [];
    }
    unlex(ts) {
        if (ts.length == 0) {
            return '';
        }
        let noSpaceAfter = /^[\(\-\[]/;
        let noSpaceBefore = /^[\.\,\?\!\)\:\;\-\]]/;
        let s = '';
        for (let i = 0; i < ts.length; i++) {
            let t = ts[i].s;
            let after = i < ts.length - 1 ? ts[i + 1].s : null;
            s += t;
            if (after != null
                && !t.match(noSpaceAfter)
                && !after.match(noSpaceBefore)) {
                s += ' ';
            }
        }
        return s;
    }
    // private tagIt(obj: Taggable, tag: string): Taggable {
    //   if (isString(obj)) {
    //     let o = new String(obj)
    //     o.setTag(tag)
    //     return o
    //   } else {
    //     let me = arguments.callee
    //     if (arguments.length == 2) {
    //       me.prototype = obj
    //       let o = new me()
    //       o.tag = tag
    //       return o
    //     }
    //   }
    // }
    // public showRules(): string {
    //   let ruleStr = []
    //   ruleStr.push('')
    //   for (let i = 0, j = this.rules.length; i < j; i++) {
    //     ruleStr.push(this.rules[i].show())
    //   }
    //   return ruleStr.join('')
    // }
    tokenize(string) {
        let inToken = false;
        let start = 0;
        let end;
        let tokens = [];
        let i;
        for (i = 0; i < string.length; i++) {
            if (string.charAt(i) == ' ' // space
                || string.charAt(i) == '\f' // form feed
                || string.charAt(i) == '\n' // newline
                || string.charAt(i) == '\r' // return
                || string.charAt(i) == '\t' // horizontal tab
                || string.charAt(i) == '\v' // vertical tab
                || string.charAt(i) == String.fromCharCode(160) // &nbsp;
            ) {
                if (inToken) {
                    end = i - 1;
                    inToken = false;
                    tokens.push(string.substr(start, end - start + 1));
                }
            }
            else {
                if (!inToken) {
                    start = i;
                    inToken = true;
                }
            }
        }
        if (inToken) {
            end = i - 1;
            inToken = false;
            tokens.push(string.substr(start, end - start + 1));
        }
        return tokens;
    }
    parseString(string, cat) {
        let tokens = this.tokenize(string);
        let ps = new ParseState(this, cat);
        for (let i in tokens) {
            if (!ps.next(tokens[i]))
                return [];
        }
        return ps.extractTrees();
    }
    complete(input, cat) {
        // Parameter defaults
        if (input == null)
            input = '';
        // if (cat == null) cat = grammar.abstract.startcat
        // Tokenise input string & remove empty tokens
        let tokens = input.trim().split(' ');
        for (let i = tokens.length - 1; i >= 0; i--) {
            if (tokens[i] == '') {
                tokens.splice(i, 1);
            }
        }
        // Capture last token as it may be partial
        let current = tokens.pop();
        if (current == null)
            current = '';
        // Init parse state objects.
        // ps2 is used for testing whether the final token is parsable or not.
        let ps = new ParseState(this, cat);
        let ps2 = new ParseState(this, cat);
        // Iterate over tokens, feed one by one to parser
        for (let i = 0; i < tokens.length; i++) {
            if (!ps.next(tokens[i])) {
                return { 'consumed': [], 'suggestions': [] }; // Incorrect parse, nothing to suggest
            }
            ps2.next(tokens[i]); // also consume token in ps2
        }
        // Attempt to also parse current, knowing it may be incomplete
        if (ps2.next(current)) {
            ps.next(current);
            tokens.push(current);
            current = '';
        }
        // Parse is successful so far, now get suggestions
        let acc = ps.complete(current);
        // Format into just a list of strings & return
        let suggs = [];
        if (acc.value) {
            acc.value.forEach((a) => {
                a.seq.forEach((s) => {
                    switch (s.id) {
                        case 'KS': {
                            s.tokens.forEach((t) => {
                                suggs.push(t);
                            });
                            break;
                        }
                        case 'KP': {
                            s.tokens.forEach((symks) => {
                                symks.tokens.forEach((t) => {
                                    suggs.push(t);
                                });
                            });
                            break;
                        }
                    }
                });
            });
        }
        // Note: return used tokens too
        return { 'consumed': tokens, 'suggestions': suggs };
    }
}
/**
 * A string with a tag
 * This avoids modifying the String prototype, which was messy
 */
class TaggedString {
    constructor(s, tag) {
        this.s = s;
        this.tag = tag;
    }
}
function productionFromJSON(json) {
    switch (json.type) {
        case 'Apply':
            let pargs = json.args.map((parg) => {
                return new PArg(...parg.hypos, parg.fid);
            });
            return new Apply(json.fid, pargs);
        case 'Coerce':
            return new Coerce(json.arg);
        default:
            return null;
    }
}
/**
 * Apply
 */
class Apply {
    constructor(fun, args) {
        this.id = 'Apply';
        this.fun = fun;
        this.args = args;
    }
    show(cat) {
        let recStr = [];
        recStr.push(cat, ' -> ', this.fun.name, ' [', this.args, ']');
        return recStr.join('');
    }
    isEqual(obj) {
        if (this.id != obj.id || this.fun != obj.fun || this.args.length != obj.args.length)
            return false;
        for (let i in this.args) {
            if (this.args[i] != obj.args[i])
                return false;
        }
        return true;
    }
}
/**
 * Coerce
 */
class Coerce {
    constructor(arg) {
        this.id = 'Coerce';
        this.arg = arg;
    }
    show(cat) {
        let recStr = [];
        recStr.push(cat, ' -> _ [', this.arg, ']');
        return recStr.join('');
    }
}
/**
 * PArg
 */
class PArg {
    // parameters 0..n-1 = hypos, parameter n = fid
    constructor(...hypos) {
        this.fid = hypos[hypos.length - 1];
        if (hypos.length > 1)
            this.hypos = hypos.slice(0, hypos.length - 1);
        else
            this.hypos = [];
    }
}
/**
 * Const
 */
class Const {
    constructor(lit, toks) {
        this.id = 'Const';
        this.lit = lit;
        this.toks = toks;
    }
    show(cat) {
        let recStr = [];
        recStr.push(cat, ' -> ', this.lit.print());
        return recStr.join('');
    }
    isEqual(obj) {
        if (this.id != obj.id || this.lit.isEqual(obj.lit) || this.toks.length != obj.toks.length)
            return false;
        for (let i in this.toks) {
            if (this.toks[i] != obj.toks[i])
                return false;
        }
        return true;
    }
}
/**
 * CncFun
 */
class CncFun {
    constructor(name, lins) {
        this.name = name;
        this.lins = lins;
    }
}
function symFromJSON(json) {
    switch (json.type) {
        case 'SymCat':
            return new SymCat(json.args[0], json.args[1]);
        case 'SymLit':
            return new SymLit(json.args[0], json.args[1]);
        case 'SymKS':
            return new SymKS(...json.args);
        case 'SymKP':
            let args = json.args[0].map((sym) => {
                return new SymKS(...sym.args);
            });
            let alts = json.args[1].map((alt) => {
                let tokens = alt.args[0].map((sym) => {
                    return new SymKS(...sym.args);
                });
                return new Alt(tokens, alt.args[1]);
            });
            return new SymKP(args, alts);
        // case 'SymVar':
        // case 'SymNE':
        default:
            return null;
    }
}
/**
 * SymCat: Object to represent argument projections in grammar rules
 */
class SymCat {
    constructor(i, label) {
        this.id = 'Arg';
        this.i = i;
        this.label = label;
    }
    show() {
        let argStr = [];
        argStr.push(this.i, this.label);
        return argStr.join('.');
    }
}
/**
 * SymKS: Object to represent terminals in grammar rules
 */
class SymKS {
    constructor(...tokens) {
        this.id = 'KS';
        this.tokens = tokens;
    }
    show() {
        let terminalStr = [];
        terminalStr.push('"', this.tokens, '"');
        return terminalStr.join('');
    }
    tagWith(tag) {
        let s = new SymKS();
        s.tokens = [...this.tokens]; // copy array
        s.tag = tag;
        return s;
    }
}
/**
 * SymKP: Object to represent pre in grammar rules
 */
class SymKP {
    constructor(tokens, alts) {
        this.id = 'KP';
        this.tokens = tokens;
        this.alts = alts;
    }
    show() {
        let terminalStr = [];
        terminalStr.push('"', this.tokens, '"');
        return terminalStr.join('');
    }
    tagWith(tag) {
        let s = new SymKP([...this.tokens], [...this.alts]); // copy arguments
        s.tag = tag;
        return s;
    }
}
/**
 * Alt
 */
class Alt {
    constructor(tokens, prefixes) {
        this.tokens = tokens;
        this.prefixes = prefixes;
    }
}
/**
 * SymLit: Object to represent pre in grammar rules
 */
class SymLit {
    constructor(i, label) {
        this.id = 'Lit';
        this.i = i;
        this.label = label;
    }
    getId() {
        return this.id;
    }
    show() {
        let argStr = [];
        argStr.push(this.i, this.label);
        return argStr.join('.');
    }
}
/**
 * Trie
 */
class Trie {
    constructor() {
        this.value = null;
        this.items = {};
    }
    insertChain(keys, obj) {
        let node = this;
        keys.forEach((key) => {
            let nnode = node.items[key];
            if (nnode == null) {
                nnode = new Trie();
                node.items[key] = nnode;
            }
            node = nnode;
        });
        node.value = obj;
    }
    insertChain1(keys, obj) {
        let node = this;
        keys.forEach((key) => {
            let nnode = node.items[key];
            if (nnode == null) {
                nnode = new Trie();
                node.items[key] = nnode;
            }
            node = nnode;
        });
        if (node.value == null)
            node.value = [obj];
        else
            node.value.push(obj);
    }
    lookup(key) {
        return this.items[key];
    }
    isEmpty() {
        if (this.value != null)
            return false;
        for (let _ in this.items) {
            return false;
        }
        return true;
    }
}
/**
 * ParseState
 */
class ParseState {
    constructor(concrete, startCat) {
        this.concrete = concrete;
        this.startCat = startCat;
        this.items = new Trie();
        this.chart = new Chart(concrete);
        let items = [];
        let fids = concrete.startCats[startCat];
        if (fids != null) {
            let fid;
            for (fid = fids.s; fid <= fids.e; fid++) {
                let exProds = this.chart.expandForest(fid);
                for (let j in exProds) {
                    let rule = exProds[j];
                    let fun = rule.fun;
                    for (let lbl in fun.lins) {
                        items.push(new ActiveItem(0, 0, rule.fun, fun.lins[lbl], rule.args, fid, parseInt(lbl)));
                    }
                }
            }
        }
        this.items.insertChain([], items);
    }
    next(token) {
        let acc = this.items.lookup(token);
        if (acc == null) {
            acc = new Trie();
        }
        this.process(this.items.value, function (fid) {
            switch (fid) {
                // String
                case -1:
                    return new Const(new Fun('"' + token + '"'), [token]);
                // Integer
                case -2: {
                    let x = parseInt(token, 10);
                    if (token == '0' || (x != 0 && !isNaN(x)))
                        return new Const(new Fun(token), [token]);
                    else
                        return null;
                }
                // Float
                case -3: {
                    let x = parseFloat(token);
                    if (token == '0' || token == '0.0' || (x != 0 && !isNaN(x)))
                        return new Const(new Fun(token), [token]);
                    else
                        return null;
                }
            }
            return null;
        }, function (tokens, item) {
            if (tokens[0] == token) {
                let tokens1 = [];
                for (let i = 1; i < tokens.length; i++) {
                    tokens1[i - 1] = tokens[i];
                }
                acc.insertChain1(tokens1, item);
            }
        });
        this.items = acc;
        this.chart.shift();
        return !this.items.isEmpty();
    }
    /**
     * For a ParseState and a partial input, return all possible completions
     * Based closely on ParseState.next()
     * currentToken could be empty or a partial string
     */
    complete(currentToken) {
        // Initialise accumulator for suggestions
        let acc = this.items.lookup(currentToken);
        if (acc == null)
            acc = new Trie();
        this.process(
        // Items
        this.items.value, 
        // Deal with literal categories
        function (_fid) {
            // Always return null, as suggested by Krasimir
            return null;
        }, 
        // Takes an array of tokens and populates the accumulator
        function (tokens, item) {
            if (currentToken == '' || tokens[0].indexOf(currentToken) == 0) { //if begins with...
                let tokens1 = [];
                for (let i = 1; i < tokens.length; i++) {
                    tokens1[i - 1] = tokens[i];
                }
                acc.insertChain1(tokens1, item);
            }
        });
        // Return matches
        return acc;
    }
    extractTrees() {
        this.process(this.items.value, function (_fid) {
            return null;
        }, function (_tokens, _item) {
        });
        let totalFIds = this.concrete.totalFIds;
        let forest = this.chart.forest;
        function go(fid) {
            if (fid < totalFIds) {
                return [new Fun('?')];
            }
            else {
                let trees = [];
                let rules = forest[fid]; // could be undefined
                for (let j in rules) {
                    let rule = rules[j];
                    if (rule.id == 'Const') {
                        trees.push(rule.lit);
                    }
                    else {
                        rule = rule;
                        let arg_ix = [];
                        let arg_ts = [];
                        for (let k in rule.args) {
                            arg_ix[k] = 0;
                            arg_ts[k] = go(rule.args[k].fid);
                        }
                        while (true) {
                            let t = new Fun(rule.fun.name);
                            for (let k = 0; k < arg_ts.length; k++) {
                                t.setArg(k, arg_ts[k][arg_ix[k]]);
                            }
                            trees.push(t);
                            let i = 0;
                            while (i < arg_ts.length) {
                                arg_ix[i]++;
                                if (arg_ix[i] < arg_ts[i].length)
                                    break;
                                arg_ix[i] = 0;
                                i++;
                            }
                            if (i >= arg_ts.length)
                                break;
                        }
                    }
                }
                return trees;
            }
        }
        let trees = [];
        let fids = this.concrete.startCats[this.startCat];
        if (fids != null) {
            for (let fid0 = fids.s; fid0 <= fids.e; fid0++) {
                let labels = {};
                let rules = this.chart.expandForest(fid0);
                rules.forEach((rule) => {
                    for (let lbl in rule.fun.lins) {
                        labels[lbl] = true;
                    }
                });
                for (let lbl0 in labels) {
                    let lbl = parseInt(lbl0);
                    let fid = this.chart.lookupPC(fid0, lbl, 0);
                    let arg_ts = go(fid);
                    for (let i in arg_ts) {
                        let isMember = false;
                        for (let j in trees) {
                            if (arg_ts[i].isEqual(trees[j])) {
                                isMember = true;
                                break;
                            }
                        }
                        if (!isMember)
                            trees.push(arg_ts[i]);
                    }
                }
            }
        }
        return trees;
    }
    process(agenda, literalCallback, // this is right
    tokenCallback) {
        if (agenda != null) {
            while (agenda.length > 0) {
                let item = agenda.pop();
                let lin = item.seq;
                if (item.dot < lin.length) {
                    let sym0 = lin[item.dot];
                    switch (sym0.id) {
                        case 'Arg': {
                            let sym = sym0;
                            let fid = item.args[sym.i].fid;
                            let label = sym.label;
                            let items = this.chart.lookupAC(fid, label);
                            if (items == null) {
                                let rules = this.chart.expandForest(fid);
                                for (let j in rules) {
                                    let rule = rules[j];
                                    agenda.push(new ActiveItem(this.chart.offset, 0, rule.fun, rule.fun.lins[label], rule.args, fid, label));
                                }
                                this.chart.insertAC(fid, label, [item]);
                            }
                            else {
                                let isMember = false;
                                for (let j in items) {
                                    if (items[j].isEqual(item)) {
                                        isMember = true;
                                        break;
                                    }
                                }
                                if (!isMember) {
                                    items.push(item);
                                    let fid2 = this.chart.lookupPC(fid, label, this.chart.offset);
                                    if (fid2 != null) {
                                        agenda.push(item.shiftOverArg(sym.i, fid2));
                                    }
                                }
                            }
                            break;
                        }
                        case 'KS': {
                            let sym = sym0;
                            tokenCallback(sym.tokens, item.shiftOverTokn());
                            break;
                        }
                        case 'KP': {
                            let sym = sym0;
                            let pitem = item.shiftOverTokn();
                            sym.tokens.forEach((symks) => {
                                tokenCallback(symks.tokens, pitem);
                            });
                            sym.alts.forEach((alt) => {
                                // tokenCallback(alt.tokens, pitem)
                                alt.tokens.forEach((symks) => {
                                    tokenCallback(symks.tokens, pitem);
                                });
                            });
                            break;
                        }
                        case 'Lit': {
                            let sym = sym0;
                            let fid = item.args[sym.i].fid;
                            let rules = this.chart.forest[fid];
                            if (rules != null) {
                                tokenCallback(rules[0].toks, item.shiftOverTokn());
                            }
                            else {
                                let rule = literalCallback(fid);
                                if (rule != null) {
                                    fid = this.chart.nextId++;
                                    this.chart.forest[fid] = [rule];
                                    tokenCallback(rule.toks, item.shiftOverArg(sym.i, fid));
                                }
                            }
                            break;
                        }
                    }
                }
                else {
                    let fid = this.chart.lookupPC(item.fid, item.lbl, item.offset);
                    if (fid == null) {
                        fid = this.chart.nextId++;
                        let items = this.chart.lookupACo(item.offset, item.fid, item.lbl);
                        if (items != null) {
                            items.forEach((pitem) => {
                                let i = pitem.seq[pitem.dot].i;
                                agenda.push(pitem.shiftOverArg(i, fid));
                            });
                        }
                        this.chart.insertPC(item.fid, item.lbl, item.offset, fid);
                        this.chart.forest[fid] = [new Apply(item.fun, item.args)];
                    }
                    else {
                        let labels = this.chart.labelsAC(fid);
                        if (labels != null) {
                            for (let lbl in labels) {
                                agenda.push(new ActiveItem(this.chart.offset, 0, item.fun, item.fun.lins[lbl], item.args, fid, parseInt(lbl)));
                            }
                        }
                        let rules = this.chart.forest[fid];
                        let rule = new Apply(item.fun, item.args);
                        let isMember = false;
                        rules.forEach((rule1) => {
                            if (rule1.isEqual(rule)) // TODO might need to check if Coerce here
                                isMember = true;
                        });
                        if (!isMember)
                            rules.push(rule);
                    }
                }
            }
        }
    }
}
/**
 * Chart
 */
class Chart {
    constructor(concrete) {
        this.active = {};
        this.actives = [];
        this.passive = {};
        this.forest = {};
        this.nextId = concrete.totalFIds;
        this.offset = 0;
        for (let fid in concrete.pproductions) {
            this.forest[fid] = concrete.pproductions[fid];
        }
    }
    lookupAC(fid, label) {
        let tmp = this.active[fid];
        if (tmp == null)
            return null;
        return tmp[label];
    }
    lookupACo(offset, fid, label) {
        let tmp;
        if (offset == this.offset)
            tmp = this.active[fid];
        else
            tmp = this.actives[offset][fid];
        if (tmp == null)
            return null;
        return tmp[label];
    }
    labelsAC(fid) {
        return this.active[fid];
    }
    insertAC(fid, label, items) {
        let tmp = this.active[fid];
        if (tmp == null) {
            tmp = {};
            this.active[fid] = tmp;
        }
        tmp[label] = items;
    }
    lookupPC(fid, label, offset) {
        let key = fid + '.' + label + '-' + offset;
        return this.passive[key];
    }
    insertPC(fid1, label, offset, fid2) {
        let key = fid1 + '.' + label + '-' + offset;
        this.passive[key] = fid2;
    }
    shift() {
        this.actives.push(this.active);
        this.active = {};
        this.passive = {};
        this.offset++;
    }
    expandForest(fid) {
        let rules = [];
        let forest = this.forest;
        let go = function (rules0) {
            for (let i in rules0) {
                let rule = rules0[i];
                switch (rule.id) {
                    case 'Apply':
                        rules.push(rule);
                        break;
                    case 'Coerce':
                        go(forest[rule.arg]);
                        break;
                }
            }
        };
        go(this.forest[fid]);
        return rules;
    }
}
/**
 * ActiveItem
 */
class ActiveItem {
    constructor(offset, dot, fun, seq, args, fid, lbl) {
        this.offset = offset;
        this.dot = dot;
        this.fun = fun;
        this.seq = seq;
        this.args = args;
        this.fid = fid;
        this.lbl = lbl;
    }
    isEqual(obj) {
        return (this.offset == obj.offset &&
            this.dot == obj.dot &&
            this.fun == obj.fun &&
            this.seq == obj.seq &&
            this.args == obj.args &&
            this.fid == obj.fid &&
            this.lbl == obj.lbl);
    }
    shiftOverArg(i, fid) {
        let nargs = [];
        for (let k in this.args) {
            nargs[k] = this.args[k];
        }
        nargs[i] = new PArg(fid);
        return new ActiveItem(this.offset, this.dot + 1, this.fun, this.seq, nargs, this.fid, this.lbl);
    }
    shiftOverTokn() {
        return new ActiveItem(this.offset, this.dot + 1, this.fun, this.seq, this.args, this.fid, this.lbl);
    }
}
/**
 * Utilities
 */
/* from Remedial JavaScript by Douglas Crockford, http://javascript.crockford.com/remedial.html */
// function isString(a: any): boolean {
//   return typeof a == 'string' || a instanceof String
// }
// function isArray(a: any): boolean {
//   return a && typeof a == 'object' && a.constructor == Array
// }
function isUndefined(a) {
    return typeof a == 'undefined';
}
// function isBoolean(a: any): boolean {
//   return typeof a == 'boolean'
// }
// function isNumber(a: any): boolean {
//   return typeof a == 'number' && isFinite(a)
// }
// function isFunction(a: any): boolean {
//   return typeof a == 'function'
// }
function mapObject(obj, fun) {
    let obj2 = {}; // eslint-disable-line @typescript-eslint/no-explicit-any
    for (let x in obj) {
        obj2[x] = fun(obj[x]);
    }
    return obj2;
}
