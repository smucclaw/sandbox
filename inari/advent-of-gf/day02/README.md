# Day 02

You should have [Python bindings to GF](https://pypi.org/project/pgf/). If not, install with `pip install pgf`.


1. Create a PGF

    ```
    $ gf -make NumberSharesEng.gf
    ```

2. Interpret
    ```
    $ python interpret.py
    ```

You should get a list of values for the shares from A to L.
```
Original: 1000
New: 200
ClassA: 1200
…
ClassL: …
```
