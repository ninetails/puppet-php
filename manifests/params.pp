class php::params {
  case $::osfamily {
    debian: {
      $ppa = hiera('php::ppa', 'ppa:ondrej/php5')
      $hostname = hiera('php::hostname', "vagrant.ninetails.com.br")
      $vagrant_dir = hiera('php::vagrant_dir', '/vagrant')
      $public_dir = hiera('php::public_dir', "${vagrant_dir}")
      $apache_aliases = hiera('php::apache_aliases', nil)
      $apache_package_name = hiera('php::apache_package_name', 'apache2')
      $apache_service_name = hiera('php::apache_service_name', 'apache2')
      $apache_dir = hiera('php::apache_dir', '/etc/apache2')
      $apache_sites_available_dir = hiera('php::apache_sites_available_dir', "${apache_dir}/sites-available")
      $php_dir = hiera('php::php_dir', '/etc/php5')
      $php_package_name = hiera('php::php_package_name', 'php5')
      $php_xdebug_package = hiera('php::php_xdebug_package', 'php5-xdebug')
      $php_module_prefix = hiera('php::php_module_prefix', 'php5-')
      $fpm_package_name = hiera('php::fpm_package_name', 'php5-fpm')
      $fpm_service_name = hiera('php::fpm_service_name', 'php5-fpm')
      $fpm_dir = hiera('php::fpm_dir', "${php_dir}/fpm")
      $php_cli_dir = hiera('php::php_cli_dir', "${php_dir}/cli")
      $pear_package_name = hiera('php::pear_package_name', 'php-pear')
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
