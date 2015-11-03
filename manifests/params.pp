# The default values for the module
class ntpd::params {
  $server = "ntp.${::domain}"
  $servers = undef
  $listenon = '# listen on *'
}
