name "base_server"
description "The base role for all server nodes"
run_list(
  "recipe[openssh]",
  "recipe[users]",
  "recipe[sudo]",
  "recipe[rvm]"
)
default_attributes(
  :rvm => {
    :default_ruby             => "ruby-1.9.2-p180"
  },
  :iptables => {
    :status                   => "enable"
  }
)
