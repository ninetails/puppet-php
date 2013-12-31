class php::config {
  php::module { [
    'cli',
    'xdebug'
  ]:
    require => Package[$php::params::php_package_name],
  }

  file { "${php::params::php_dir}/mods-available/local.ini":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/php5/local.ini.erb'),
    require => Php::Module['cli'],
  }

  file { "${php::params::php_cli_dir}/conf.d/00-local.ini":
    ensure  => 'link',
    target  => "${php::params::php_dir}/mods-available/local.ini",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File["${php::params::php_dir}/mods-available/local.ini"],
    notify  => Class['php::fpm::service'],
  }
}