# Drinks grammar


### How to use

```
$ gf DrinksSinglish.gf DrinksKiwi.gf
Drinks> p -lang=Singlish "kopi o kosong" | l
coffe black yeah nah
kopi o kosong

Drinks> p -lang=Singlish "kopi o kosong tabao" | l
coffe black yeah nah takeaway
kopi o kosong tabao

Drinks> gr | l -treebank
Drinks: Order Teh Condensed AllTheWay LessSugar DefaultTemperature TakeAway
DrinksKiwi: tea with condensed milk totes pour sugar takeaway
DrinksSinglish: teh dilo siu dai tabao
```