abstract MiniAmbiguous = {
    flags startcat = VP ;
    cat
      VP ; NP ; Adv ;
    fun
      at_home : Adv ;
      on_soft_mattress : Adv ;
      legal_work : NP ;
      perform : NP -> VP ;
      sleep : VP ;
      depend_on : NP -> VP ;
      AdvVP : VP -> Adv -> VP ;
      AdvNP : NP -> Adv -> NP ;
}