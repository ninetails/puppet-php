class php::pear::config {
  exec { 'pear config':
    command => 'pear config-set auto_discover 1',
    require => Class['php::pear::install'],
  }

  exec { 'pear upgrade':
    command => 'pear upgrade PEAR',
    require => Exec['pear config'],
  }

  exec { 'pear update-channels':
    command => 'pear update-channels',
    require => Exec['pear upgrade'],
  }
}
