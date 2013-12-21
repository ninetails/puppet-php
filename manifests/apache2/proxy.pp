class php::apache2::proxy {
  exec { 'a2enmod proxy_fcgi':
    require => Class['php::apache2::install'],
    notify  => Class['php::apache2::service'],
  }
}
