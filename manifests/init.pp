# The configuration and service management
# of OpenNTPd
class ntpd (
  $server = $::ntpd::params::server,
  $servers = $::ntpd::params::servers,
  $listenon = $::ntpd::params::listenon,
) inherits ntpd::params {

  file { '/etc/ntpd.conf':
    ensure  => file,
    content => template('ntpd/ntpd.conf.erb'),
  }
  service { 'ntpd':
    ensure => 'running',
    enable => true
  }

  File['/etc/ntpd.conf'] ~>
  Service['ntpd']

}
