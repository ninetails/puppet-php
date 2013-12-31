define php::pear::channeldiscover {
  exec { "channel discover ${name}":
    command => "pear channel-discover ${name}",
    require => Exec['pear upgrade'],
    notify => Exec['pear update-channels'],
  }
}
