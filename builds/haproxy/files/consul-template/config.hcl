consul = "10.10.10.10:8500"
retry  = "10s"

max_stale = "1m"
log_level = "info"
pid_file  = "/var/run/consul-template.pid"

wait = "5s:10s"


deduplicate {
  enabled = true
  prefix  = "consul-template/dedup/"
}

template {
  source          = "/consul-template/templates/haproxy.ctmpl"
  destination     = "/usr/local/etc/haproxy/haproxy.cfg"
  command         = "haproxy-systemd-wrapper -f /usr/local/etc/haproxy/haproxy.cfg -sf $(pidof haproxy) &"
  command_timeout = "60s"
  perms           = 0600
  backup          = true
}