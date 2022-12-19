EF EX[notify_indiv_happened(org)]
EF (
  {exists_active_rule_with({NCProhib, CProhib}, notify_indiv, org)} &
  EG {breached_by = None}
)