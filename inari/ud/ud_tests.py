import spacy_udpipe

spacy_udpipe.download("en") # download English model
nlp = spacy_udpipe.load("en")

def create_conllu(text, filename):
    doc = nlp(text)
    for token in doc:
        udID     = str(token.i+1)      # word position
        udFORM   = token.text     # surface form
        udLEMMA  = token.lemma_   # lemma
        udPOS    = token.pos_     # UD universal POS
        udXPOS   = "_"            # UD language specific POS tag
        udFEATS  = "_"            # morphological features
        udHEAD   = str(token.head.i+1) # head of this word
        udDEPREL = token.dep_     # label of this word
        udDEPS   = "_"            # "Enhanced dependency graph in the form of a list of head-deprel pairs"
        udMISC   = "_"            # any other annotation

        # The head of the root word needs to be manually added to 0
        if udDEPREL == "ROOT":
            udHEAD = "0"

        udTuple = (udID, udFORM, udLEMMA, udPOS, udXPOS, udFEATS, udHEAD, udDEPREL, udDEPS, udMISC)
        udString = "\t".join(udTuple)

        # print to file
        print(udString, file=open(filename, 'a'))

        # also print it to stdout
        print(udString)


if __name__ == "__main__()":
    create_conllu("the cat sleeps", "/tmp/cat.conllu")