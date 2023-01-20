# Day 02

You should have [Python bindings to GF](https://pypi.org/project/pgf/). If not, install with `pip install pgf`.


1. Create a PGF

    ```
    $ gf -make NumberSharesEng.gf
    ```

2. Interpret
    ```
    $ python interpret.py
    Number of original shares:
    > 4534
    Number of new shares:
    > three thousand fifty 
    ```
    
    (Alternatively, you can leave the number of shares blank, and it will default to *1000* and *two hundred*.)

You should get a list of values for the shares from A to L.
```
Original: 1000
New: 200
ClassA: 1200
…
ClassL: …
```
