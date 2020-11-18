import src.GildedRose as GR

class Item:

    def __init__(self,item_name : str, isLegendary : bool , isConjured : bool, 
            isAged: bool, isBackstagePass : bool,
            sellIn : int, quality : int):
        self.item_name = item_name
        self.isLegendary = isLegendary
        self.isConjured = isConjured
        self.isAged = isAged
        self.isBackstagePass = isBackstagePass
        self.sellIn = sellIn
        self.quality = quality

    ## equality of instances
    def __eq__(self, other): 
        if not isinstance(other, Item):
            # don't attempt to compare against unrelated types
            return NotImplemented
        else: 
            instance_equality = True
            left = vars(self)
            right = vars(other)
            for key in left.keys():
                instance_equality = (left[key] == right[key]) and instance_equality
        
        return instance_equality


    def update(self, deltaDays : int):
        fstr = ""; gstr = "" 
        tmp_sellIn = self.sellIn
        tmp_quality = self.quality

        for i in range(deltaDays):
            deltaVals = GR.Quality_Change_logic(self.isLegendary,
                    self.isConjured, self.isAged,
                    self.isBackstagePass, tmp_sellIn, tmp_quality)

            fstr = "(lambda sellIn: " + deltaVals["Delta Sell In"] + ") (%d)" % (tmp_sellIn)
            gstr = "(lambda quality: " + deltaVals["Delta Quality"] + ") (%d)" % (tmp_quality)
        
            tmp_sellIn = eval(fstr)
            tmp_quality = eval(gstr)
        
        self.sellIn = tmp_sellIn
        self.quality = tmp_quality

        print(vars(self))
        return None



