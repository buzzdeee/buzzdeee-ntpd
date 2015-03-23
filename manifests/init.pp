class ntpd ( $server = undef, $listenon = undef ) { 
  if $server == undef {
    $_server = "wormhole.l00-bugdead-prods.de"
  } else {
    $_server = $server
  }
  if $listenon == undef {
    $_listenon = "# listen on *"
  } else {
    $_listenon = $listenon
  }

  service { "ntpd":
    ensure  	=> "running",
    enable  	=> "true",
    flags  	=> "-s",
    subscribe 	=> File['/etc/ntpd.conf'],
  }
  file { '/etc/ntpd.conf':
    ensure  => file,
    notify  => Service["ntpd"],
    content => template('ntpd/ntpd.conf.erb'),
  }
}
