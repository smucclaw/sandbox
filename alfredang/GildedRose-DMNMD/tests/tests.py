from pprint import pprint
import src.GildedRose as GR

def cr8_output_dic(quality: str):
    
    if quality == "legendary" or quality == "maxQual" :
        return {'Delta Sell In' : 'sellIn -1', 
                'Delta Quality' : 'quality +0'}
    elif quality == "expiredPass":
        return {'Delta Sell In' : 'sellIn -1', 
                'Delta Quality' : '0'}
    else:
        return {'Delta Sell In' : 'sellIn -1', 
                'Delta Quality' : 'max(0 ,quality ' + quality}

def cre8_test_cases():
    return None


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
    test_out = Quality_Change_tests()
    pprint(test_out)




