probcli -csp_assertion "P(5) |= CTL: \"AG true\"" test.csp \
  -dot state_space_sfdp "test.dot"

dot -Tsvg test.dot -o test.svg