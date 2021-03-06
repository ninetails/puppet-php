class php::composer {
  include php

  if (!defined(Package['curl'])) {
    package { 'curl':
      ensure => present,
      notify => Exec['install composer'],
    }
  }

  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | php',
    cwd => '/home/vagrant',
    require => [
      Package['curl'],
      Package['php5']
    ],
  }

  exec { 'install composer globally':
    command => 'mv composer.phar /usr/local/bin/composer',
    cwd => '/home/vagrant',
    require => Exec['install composer'],
  }
}
