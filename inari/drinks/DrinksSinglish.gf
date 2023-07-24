concrete DrinksSinglish of Drinks = {


    lincat
       BaseDrink,
       Drink,
       Milk,
       Thickness,
       Sweetness,
       Temperature,
       Location = Str ;

    lin

       Kopi = "kopi" ;
       Teh = "teh" ;

       Condensed = "" ;
       Evaporated = "c" ;
       NoMilk = "o" ;

       DefaultThickness = "" ;
       Thin = "po" ;
       Thick = "gao" ;
       AllTheWay = "dilo" ;

       DefaultSweetness = "" ;
       MoreSugar = "ga dai" ;
       LessSugar = "siu dai" ;
       NoSugar = "kosong" ;

       DefaultTemperature = "" ;
       Ice = "peng" ;
       Lukewarm = "bua shio" ;

       HaveHere = "" ;
       TakeAway = "tabao" ;

       ----

       Order kopi o po kosong peng tabao = kopi ++ o ++ po ++ kosong ++ peng ++ tabao ;


}