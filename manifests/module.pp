define php::module (
    $module_prefix = $php::params::php_module_prefix
  ) {
  include php

  package { "php-${name}":
    ensure  => $version,
    name    => "${module_prefix}${name}",
    require => Package[$php::params::php_package_name],
  }
}
