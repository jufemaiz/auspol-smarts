name "mythtv_backend_server"
description "A backend instance of MythTV for recording/livetv"
run_list(
  "role[server]",
  "recipe[mythtv::master_backend]"
)
default_attributes(
  :mysql => {
    :iptables_allow           => "enable"
  }
)
