abstract Drinks = {

    flags startcat = Drink ;
    cat
       BaseDrink ;
       Drink ;
       Milk ;
       Thickness ;
       Sweetness ;
       Temperature ;

    fun

       Kopi, Teh : BaseDrink ;

       Condensed, Evaporated, NoMilk : Milk ;

       DefaultThickness, Thin, Thick, AllTheWay : Thickness ;

       DefaultSweetness, MoreSugar, LessSugar, NoSugar : Sweetness ;

       DefaultTemperature, Ice, Lukewarm : Temperature ;


       ----

       Order : BaseDrink -> Milk -> Thickness -> Sweetness -> Temperature -> Drink ;


}