concrete GermanTaxGer of GermanTax = {
  lincat
    AP = Str ;
    Adv = Str ;
    CN = Str ;
    Item = Str ;
    Line = Str ;
    ListAdv = Str ;
    Meta = Str ;
    NP = Str ;
    Num = Str ;
    RS = Str ;
    Ref = Str ;
    Title = Str ;
    V = Str ;
    VP = Str ;
  lin
    Line_Item Item = Item ++ ".";
    Line_Meta Meta = Meta ++ "." ;
    Line_Num_Adv_sind_zunächst_NP_dann_NP_zu_VP Num Adv NP NP VP = Num ++ Adv ++ "sind zunächst" ++ NP ++ "dann" ++ NP ++ "zu" ++ VP ;
    Line_Num_NP_AP_nach_Ref_ist_NP Num NP AP Ref NP = Num ++ NP ++ AP ++ "nach" ++ Ref ++ "ist" ++ NP ;
    Line_Num_NP_ist_Adv_ListAdv_zu_VP Num NP Adv ListAdv VP = Num ++ NP ++ "ist" ++ Adv ++ ListAdv ++ VP ;
    Line_Num_NP_ist_Adv_VP_RS Num NP Adv VP RS = Num ++ NP ++ "ist" ++ Adv ++ VP ++ RS ;
    Line_Title Title = Title ++ "." ;

    AP_VP VP = VP ;

    Adv_Bei_NP NP = "bei" ++ NP ;
    Adv_durch_negative_Summen_NP_aus_anderen_CN NP CN = "durch negative Summen" ++ NP ++ "aus anderen" ++ CN ;
    Adv_in_NP NP = "in" ++ NP ;
    Adv_nur_bis_zur_Hälfte = "nur bis zur Hälfte" ;
    Adv_soweit_sie_den_Betrag_von_100_000_Euro_übersteigt = "soweit sie den Betrag von 100 000 Euro übersteigt" ;
    ListAdv_Adv Adv = Adv ;
    ListAdv_Adv_ListAdv Adv ListAdv = Adv ++ ListAdv ;

    CN_Einkunftsart = "Einkunftsart" ;
    CN_Einkünfte = "Einkünfte" ;
    CN_Minderung = "Minderung" ;
    CN_Summe = "Summe" ;
    CN_Verhältnis = "Verhältnis" ;

    Item_3 = "(3)" ;
    Meta_199920002002_mit_EuroBeträge = "1999/2000/2002 mit Euro-Beträge" ;

    NP_Einkunftsarten = "Einkunftsarten" ;
    NP_dem_CN CN = "dem" ++ CN ;
    NP_die_CN CN = "die" ++ CN ;
    NP_der_CN CN = "der" ++ CN ;
    NP_den_Altersentlastungsbetrag_und_den_Abzug = "den Altersentlastungsbetrag und den Abzug" ;
    NP_der_Ermittlung_NP_NP NP1 NP2 = "der Ermittlung" ++ NP1 ++ NP2 ;
    NP_der_Gesamtbetrag_NP NP = "der Gesamtbetrag" ++  NP ;
    NP_der_positiven_CN CN = "der positiven" ++ CN ;
    NP_die_Summe_NP NP = "die Summe" ++ NP ;
    NP_die_Summen_NP NP = "die Summen" ++ NP ;
    NP_jeweils_NP_aus_jeder_CN NP CN = "jeweils" ++ NP ++ "aus jeder" ++ CN ;
    'Num_²' = "²" ;
    'Num_³' = "³" ;
    'Num_¹' = "¹" ;
    'Num_⁴' = "⁴" ;
    RS_in_dem_die_positiven_Summen_NP_aus_verschiedenen_NP_VP NP1 NP2 VP = "in dem die positiven Summen" ++ NP1 ++ "aus verschiedenen" ++ NP2 ++ VP ;
    Ref_13_Abs_3 = "§ 13 Abs. 3" ;
    Title_2_Abs_3_EStG_idF_des_Steuerentlastungsgesetze = "§ 2 Abs. 3 EStG i.d.F. des Steuerentlastungsgesetze" ;
    VP_V V = V ;
    VP_vermindert_um_NP NP = "vermindert um" ++ NP ;
    VP_zur_CN_NP_V CN NP V = "zur" ++ CN ++ NP ++ V ;
    V_ermitteln = "ermitteln" ;
    V_mindern = "mindern" ;
    V_stehen = "stehen" ;
    V_vorzunehmen = "vorzunehmen" ;
}