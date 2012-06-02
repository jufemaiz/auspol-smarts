name "web_server"
description "A web server deployment with nginx/passenger."
run_list(
  "role[server]",
  "recipe[nginx::source]"
)
override_attributes(
  :nginx => {
    :extra_configure_flags    => [ "--with-http_sub_module" ]
  }
)
