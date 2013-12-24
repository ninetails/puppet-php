
class php(
  $cli_ini_content = undef,
  $cli_ini_source = undef
) {
  include php::params
  include php::ppa
  include php::install
  include php::config
}
