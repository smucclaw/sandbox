def Quality_Change_logic ( Legendary, Conjured, Aged_Brie, Backstage_Pass, Sell_In, Quality ) :
  if (Legendary == True and Conjured == False and Aged_Brie == False and Backstage_Pass == False): # 1
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"quality +0"};
    # Legendary Items

  elif (Legendary == False and Quality > 50.0): # 2
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"quality +0"};
    # Quality = 50

  elif (Legendary == False and Conjured == True and Aged_Brie == False and Backstage_Pass == False and Sell_In <= 0.0): # 3
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality -4)"};
    # Conjured (Expired)

  elif (Legendary == False and Conjured == True and Aged_Brie == False and Backstage_Pass == False and Sell_In > 0.0): # 4
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality -2)"};
    # Conjured (Fresh)

  elif (Legendary == False and Aged_Brie == True and Backstage_Pass == False): # 5
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality +1)"};
    # Aged Brie

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == True and (6.0 <= Sell_In and Sell_In <= 10.0)): # 6
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality +2)"};
    # Backstage Pass (<= 10 days to concert)

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == True and (1.0 <= Sell_In and Sell_In <= 5.0)): # 7
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality +3)"};
    # Backstage Pass (<= 5 days to concert)

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == True and Sell_In < 0.0): # 8
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"0"};
    # Backstage Pass (Expired)

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == True): # 9
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality +1)"};
    # Backstage Pass (Fresh)

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == False and Sell_In > 0.0): # 10
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality -1)"};
    # "Normal" (Fresh)

  elif (Legendary == False and Conjured == False and Aged_Brie == False and Backstage_Pass == False and Sell_In <= 0.0): # 11
    return {"Delta Sell In":"sellIn -1", "Delta Quality":"max(0, quality -2)"};
    # "Normal" (Expired)


