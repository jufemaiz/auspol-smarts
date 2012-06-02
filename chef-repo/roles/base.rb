name "base"
description "The base role for all nodes"
run_list(
  "recipe[git]",
  "recipe[mercurial]",
  "recipe[bashrc]",
  "recipe[platform_packages]"
)
default_attributes(
  :platform_packages => [
    { :name => "tree" }
  ]
)
