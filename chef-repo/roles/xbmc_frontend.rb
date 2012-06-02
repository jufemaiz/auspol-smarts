name "xbmc_frontend"
description "An Ubuntu Linux frontend for XBMC"
run_list(
  "role[server]",
  "recipe[xbmc::live]"
)
