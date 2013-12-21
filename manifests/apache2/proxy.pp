class php::apache2::proxy {
  exec { 'a2enmod proxy_fcgi':
    require => [
      Class['php::apache2::install'],
      Package[$php::params::fpm_package_name]
    ],
    notify  => Class['php::apache2::service'],
  }
}
