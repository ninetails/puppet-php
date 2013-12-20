class php::apache2::config {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  exec { 'a2enmod rewrite':
    command => 'a2enmod rewrite',
    require => Class['php::apache2::install'],
    notify  => Class['php::apache2::service'],
  }

  exec { 'a2enmod proxy_fcgi':
    command => 'a2enmod proxy_fcgi',
    require => [Class['php::apache2::install'], Class['php::fpm::install']],
    notify  => [Class['php::apache2::service'], Class['php::fpm::service']],
  }

  file { "${php::params::apache_sites_available_dir}/001-vagrant.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/apache2/001-vagrant.conf.erb'),
    require => Class['php::apache2::install'],
    notify  => Exec['a2ensite 001-vagrant.conf'],
  }

  exec { 'a2ensite 001-vagrant.conf':
    command => 'a2ensite 001-vagrant.conf',
    notify  => Class['php::apache2::service'],
  }

  exec { 'a2dis site 000-default.conf':
    command => 'a2dissite 000-default',
    require => Class['php::apache2::install'],
    notify  => Class['php::apache2::service'],
  } 
}
