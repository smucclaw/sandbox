import dis

def test(a):
    x = 0

    if a > 0 and a < 5:
        x =1

    b = a + 1

    if x == 1 and b > 6:
        print("Hello!")

dis.dis(test)