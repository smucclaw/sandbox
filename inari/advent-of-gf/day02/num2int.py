import pgf

"""
to test:
    echo "pg -pgf" | gf -run alltenses/NumeralEng.gfo
or some other language, then
    python3 int2numeral.py
which waits for numeral input.
If you just press <enter>, a predefined list of samples is converted.

to use in your own program: see int2numeral_example.py
"""

def numeral2int(numeral):
    f,args = numeral.unpack()
    if f=="num":
        return nd1000000(args[0])

def nd(digit):
    f,_ = digit.unpack()
    if f in ["n2","n3","n4","n5","n6","n7","n8","n9"]:
        return int(f[1])

def nd10(sub10):
    f,args = sub10.unpack()
    if f=="pot01":
        return 1
    elif f=="pot0":
        return nd(args[0])
    else:
        print("nd10: can't handle", sub10)


def nd100(sub100):
    f,args = sub100.unpack()
    if f=="pot0as1":
        return nd10(args[0])
    elif f=="pot110":
        return 10
    elif f=="pot111":
        return 11
    elif f=="pot1to19":
        return 10 + nd(args[0])
    elif f=="pot1":
        return 10 * nd(args[0])
    elif f=="pot1plus":
        return (10 * nd(args[0])) + nd10(args[1])
    else:
        print("nd100: can't handle", sub100)


def nd1000(sub1000):
    f,args = sub1000.unpack()
    if f=="pot1as2":
        return nd100(args[0])
    elif f=="pot2":
        return 100 * nd10(args[0])
    elif f=="pot2plus":
        return (100 * nd10(args[0])) + nd100(args[1])
    else:
        print("nd1000: can't handle", sub1000)

def nd1000000(sub1000000):
    f,args = sub1000000.unpack()
    if f=="pot2as3":
        return nd1000(args[0])
    elif f=="pot3":
        return 1000 * nd1000(args[0])
    elif f=="pot3plus":
        return (1000 * nd1000(args[0])) + nd1000(args[1])