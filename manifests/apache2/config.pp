class php::apache2::config {
  exec { 'a2enmod rewrite':
    require => Class['php::apache2::install'],
    notify  => Class['php::apache2::service'],
  }

  $aliases = $php::params::apache_aliases
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
    notify  => Class['php::apache2::service'],
  }

  exec { 'a2dissite 000-default':
    require => Class['php::apache2::install'],
    notify  => Class['php::apache2::service'],
  } 
}
