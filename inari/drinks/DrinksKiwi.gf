concrete DrinksKiwi of Drinks = {


    lincat
       BaseDrink,
       Drink,
       Milk,
       Thickness,
       Sweetness,
       Temperature,
       Location = Str ;

    lin

       Kopi = "coffee" ;
       Teh = "tea" ;

       Condensed = "with condensed milk" ;
       Evaporated = "with evaporated milk" ;
       NoMilk = "black" ;

       DefaultThickness = "" ;
       Thin = "thin" ;
       Thick = "thick" ;
       AllTheWay = "totes pour" ;

       DefaultSweetness = "" ;
       MoreSugar = "sweet as" ;
       LessSugar = "sugar" ;
       NoSugar = "yeah nah" ;

       DefaultTemperature = "" ;
       Ice = "Cold" ;
       Lukewarm = "luke warm" ;

       HaveHere = "" ;
       TakeAway = "takeaway" ;


       ----

       Order kopi o po kosong peng takeaway = kopi ++ o ++ po ++ kosong ++ peng ++ takeaway ;


}