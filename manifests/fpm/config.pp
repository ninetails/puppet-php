class php::fpm::config {
  package { $php::params::php_xdebug_package:
    ensure  => 'installed',
    require => Class['php::fpm::install'],
  }
  file { "${php::params::fpm_dir}/pool.d/www.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/php/www.conf",
    require => Class['php::fpm::install'],
    notify  => Class['php::fpm::service'],
  }

  file { "${php::params::fpm_dir}/conf.d/20-xdebug.ini":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/php/20-xdebug.ini",
    require => [Class['php::fpm::install'], Package[$php::params::php_xdebug_package]],
    notify  => Class['php::fpm::service'],
  }
}