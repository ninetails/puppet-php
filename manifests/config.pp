class php::config {
  package { $php::params::php_xdebug_package:
    ensure  => 'installed',
    require => Package[$php::params::php_package_name],
  }
}