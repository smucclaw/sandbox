from lark import Lark
from lark import Transformer


class MyTransformer(Transformer):
    def list(self, items):
        return list(items)

    def pair(self, key_value):
        k, v = key_value
        return k, v

    def dict(self, items):
        return dict(items)


json_parser = Lark(r"""
    ?value: query answer+

    query : "QUERY:?-" (WORD|")"|"(")+ "."
    answer: "ANSWER:" INT "(in" DECIMAL "ms)" justification
    justification: "JUSTIFICATION_TREE:" justification_tree "global_constraint."?
    justification_tree: term ":-" term "."
    
    term : atom | functor
    atom : WORD
    functor : atom "(" term ("," term)* ")" 

    %import common.INT
    %import common.DECIMAL
    %import common.WORD
    %import common.SIGNED_NUMBER
    %import common.WS
    %ignore WS

    """, start='value')


text = """
QUERY:?- mortal(X).

	ANSWER:	1 (in 0.04 ms)

JUSTIFICATION_TREE:
mortal(socrates) :-
    human(socrates).
global_constraint.
"""


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    tree = json_parser.parse(text)
    print(MyTransformer().transform(tree))
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
