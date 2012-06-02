name "jenkins_server"
description "A web server deployment with nginx/passenger."
run_list(
  "role[server]",
  "recipe[jenkins]"
)
override_attributes(
  :jenkins => {
    :iptables_allow           => "disable",
    :http_proxy => {
      :variant                => "nginx"
    },
    :server => {
      :plugins => [
        "deploy",
        "disk-usage",
        "git",
        "github",
        "m2release",
        "mercurial",
        "rake",
        "rubyMetrics",
        "ruby",
        "URLSCM"
      ]
    }
  }
)
