name "webapp_server"
description "A webapp server deployment that can host rails/rack/etc. applications."
run_list(
  "role[server]",
  "recipe[webapp]"
)
override_attributes(
  :rvm => {
    :default_ruby             => "ree-1.8.7-2011.03",
    :rvmrc => {
      :rvm_trust_rvmrcs_flag  => 1
    }
  },
  :rvm_passenger => {
    :rvm_ruby                 => "ree-1.8.7-2011.03@passenger"
  }
)
