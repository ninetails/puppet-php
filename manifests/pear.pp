define php::pear (
    $command = undef,
    $timeout = undef
  ){
  include php
  include php::pear::install
  include php::pear::config

  $cmd = $command ? {
    undef => "pear install --alldeps -o ${name}",
    default => $command,
  }

  $tout = $timeout ? {
    undef => '300',
    default => $timeout
  }

  exec { "pear ${name}":
    command => $cmd,
    require => Class['php::pear::config'],
    timeout => $tout,
  }
}
