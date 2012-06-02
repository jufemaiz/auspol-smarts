name "gitorious_server"
description "A Gitorious stack server"
run_list(
  "role[web_server]",
  "recipe[gitorious]"
)
override_attributes(
  :nginx => {
    :iptables_ports           => [ 80, 443 ]
  }
)
