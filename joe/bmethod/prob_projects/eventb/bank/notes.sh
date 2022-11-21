# https://prob.hhu.de/w/index.php?title=LTL_Model_Checking
# https://prob.hhu.de/w/index.php?title=Summary_of_B_Syntax#Logical_predicates:
..\..\ProB\probcli .\Bank0_mch.eventb -ctlformula "EF {#(p). (p : PERSON & hasAcc(p) = TRUE)}"
