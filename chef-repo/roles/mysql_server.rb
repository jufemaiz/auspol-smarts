name "mysql_server"
description "A MySQL server deployment."
run_list(
  "role[server]",
  "recipe[mysql::server]"
)
