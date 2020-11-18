from pprint import pprint
import src.GildedRose as GR
import src.Datatype as DT

def cr8_test_case(itemList: dict, key: str,  date: int):
    bar = itemList[key]

    foo = DT.Item(
            key, 
            bar["isLegendary"], 
            bar["isConjured"],
            bar["isAged"], 
            bar["isBackstagePass"], 
            bar["values"]["%s" % (date)]["sellIn"], 
            bar["values"]["%s" % (date)]["quality"] 
        )
    # if quality == "legendary" or quality == "maxQual" :
        # return {'Delta Sell In' : 'sellIn -1', 
                # 'Delta Quality' : 'quality +0'}
    # elif quality == "expiredPass":
        # return {'Delta Sell In' : 'sellIn -1', 
                # 'Delta Quality' : '0'}
    # else:
        # return {'Delta Sell In' : 'sellIn -1', 
                # 'Delta Quality' : 'max(0 ,quality ' + quality}
    return foo 


def process_test_inputs(inList : list):
    out_dic = {} ; out_dic["items"] = {}
    db = out_dic["items"] 

    for i in range(len(inList)):
        if n := re.search(r'-* day ([0-9]+)',inList[i]):
            day = n.groups()[0]
        elif itm := re.search(r'(.+), (-*[0-9]+), ([0-9]+)',inList[i]):
            itm_name = itm.groups()[0]
            itm_sellIn = itm.groups()[1]
            itm_quality = itm.groups()[2]
            
            if itm_name not in db.keys():
                db[itm_name] = {}

                tmp = itm_name.lower()
                ## assign attributes
                db[itm_name]["isLegendary"] = False
                db[itm_name]["isConjured"] = False
                db[itm_name]["isAged"] = False
                db[itm_name]["isBackstagePass"] = False

                if re.search(r'sulfuras',tmp):
                    db[itm_name]["isLegendary"] = True
                if re.search(r'backstage pass', tmp):
                    db[itm_name]["isBackstagePass"] = True
                if re.search(r'aged ', tmp):
                    db[itm_name]["isAged"] = True
                if re.search(r'Conjured', tmp):
                    db[itm_name]["isConjured"] = True 
                
                # to store sellIn & quality values
                db[itm_name]["values"] = {}

         
            ## assign sellIn & quality values on first day appearing
            db[itm_name]["values"][day] = {}
            db[itm_name]["values"][day]["sellIn"] = itm_sellIn
            db[itm_name]["values"][day]["quality"] = itm_quality

    return out_dic


def Quality_Change_tests():
    tests = {
            "Legendary": 
                GR.Quality_Change_logic(True, False, False, False, 10, 80) == cr8_output_dic("legendary"),
            "Quality = 50":
                GR.Quality_Change_logic(False, None, None, None, 10, 51) == cr8_output_dic("maxQual"),
            "Conjured (Expired) with positive output Quality":
                GR.Quality_Change_logic(False, True, False, False, 0, 10) == cr8_output_dic("-4"),
            "Conjured (Expired) with negative output Quality (should output 0)":
                GR.Quality_Change_logic(False, True, False, False, 0, 1) == cr8_output_dic("-4"),
            "Conjured (Fresh)":
                GR.Quality_Change_logic(False, True, False, False, 1, 10) == cr8_output_dic("-2"), 
            "Aged Brie":
                GR.Quality_Change_logic(False, None, True, False, 100, 10) == cr8_output_dic("+1"), # should output sellIn = 99, quality = 11
            "Backstage Pass (Fresh)":
                GR.Quality_Change_logic(False, False, False, True, 11, 20) == cr8_output_dic("+1"), # output sellIn = 10, quality = 21
            "Backstage Pass (<= 10 days left)":
                GR.Quality_Change_logic(False, False, False, True, 10, 21) == cr8_output_dic("+2"), # output sellIn = 9, quality = 23
            "Backstage Pass (<= 5 days left)":
                GR.Quality_Change_logic(False, False, False, True, 5, 40) == cr8_output_dic("+3"), # output sellIn = 4, quality = 43
            "Backstage Pass (Expired)":
                GR.Quality_Change_logic(False, False, False, True, 0, 50) == cr8_output_dic("expiredPass"), # output sellIn = -1, quality = 0   but i think it'll output quality = 50 instead
            "Normal (Fresh)":
                GR.Quality_Change_logic(False, False, False, False, 1, 8) == cr8_output_dic("-1"), # output sellIn = 0, quality = 7
            "Normal (Expired)":
                GR.Quality_Change_logic(False, False, False, False, 0, 7) == cr8_output_dic("-2") # output sellIn = -1, quality = 5
            }

    return tests

if __name__ == "__main__":
    import re 
    
    with open('tests/test_inputs.gr','r') as f:
        raw = f.readlines()

    test_dict = process_test_inputs(raw)
    a = cr8_test_case(test_dict["items"], "Aged Brie", "0")
    b = cr8_test_case(test_dict["items"], "Aged Brie", "0")
    print("Datatype instance equality:", a==b)
    print(vars(cr8_test_case(test_dict["items"], "Aged Brie", "0")))
    print(vars(cr8_test_case(test_dict["items"], "Aged Brie", "1")))

    # test_out = Quality_Change_tests()
    # pprint(test_out)




