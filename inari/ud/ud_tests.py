import spacy
import spacy_udpipe

from spacy_conll import init_parser

# input and output files, change to your own
input = "newcorpus.txt"
output = "/tmp/legalese-fragments.conllu"

# parser
con = init_parser(
     "en", "udpipe", include_headers=True
)

def create_conllu(text, filename):
    doc_con = con(text)               # parse text
    conll = doc_con._.conll_str

    with open(filename, "a") as f:    # finishing touches & print to file
        for line in conll.splitlines()[2:]:
            lines = line.split()
            if lines[7] == "ROOT":    # ud2gf wants root in lowercase
                lines[7] = "root"
            lines[-1] = "_\n"         # add linebreak to the end
            tabsep_line = "\t".join(lines)
            f.write(tabsep_line)      # print to file


if __name__ == "__main__":
    print("", file=open(output, 'w')) # empty the file
    texts = open(input).readlines()
    for text in texts:
        create_conllu(text, output)
        print("\n", file=open(output, 'a'))

#    create_conllu("the cat sleeps", "/tmp/cat.conllu")