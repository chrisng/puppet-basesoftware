# Install packages for several operating systems
class base::packages {

  $common_packages = [ 'sudo', 'screen', 'zsh', 'wget', 'curl' ]

  case $::operatingsystem {
    centos, redhat: {
      package { $common_packagesi: }
      singleton_resources(
        Package['mc'],
        Package['vim-enhanced'],
        Package['htop'],
        Package['iftop'],
        Package['augeas'],
        Package['iotop'],
        Package['iperf'],
        Package['smartmontools'],
      )
    }
    debian, ubuntu: {
      package { $common_packagesi: }
      singleton_resources(
        Package['mc'],
        Package['vim'],
        Package['htop'],
        Package['iftop'],
        Package['augeas-tools'],
        Package['curl'],
        Package['iotop'],
        Package['iperf'],
        Package['smartmontools'],
      )
    }
    default: {
      fail('Unrecognized operating system')
    }
  }
}

