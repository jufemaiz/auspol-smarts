name "server"
description "The typical base role for a server deployment"
run_list(
  "role[base]",
  "recipe[platform_ubuntu]",
  "role[base_server]"
)
