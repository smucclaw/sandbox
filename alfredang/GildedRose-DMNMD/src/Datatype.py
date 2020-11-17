import src.GildedRose as GR

class Item:

    def __init__(self, isLegendary : bool , isConjured : bool, 
            isWineOrCheese : bool, isTicket : bool,
            sellIn : int, quality : int):
        self.isLegendary = isLegendary
        self.isConjured = isConjured
        self.isWineOrCheese = isWineOrCheese
        self.isTicket = isTicket
        self.sellIn = sellIn
        self.quality = quality

    def update(self, deltaDays : int):
        for i in range(deltaDays):
            deltaVals = GR.Quality_Change_logic(self.isLegendary,
                    self.isConjured, self.isWineOrCheese,
                    self.isTicket, self.sellIn, self.quality)
            print(deltaVals)


