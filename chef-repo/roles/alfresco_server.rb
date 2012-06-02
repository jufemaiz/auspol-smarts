name "alfresco_server"
description "An Alfresco Community deployment with tomcat/nginx/mysql."
run_list(
  "role[server]",
  "recipe[alfresco]"
)
