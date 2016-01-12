
# == Class: linux::params
#
# Global params of module 'Linux'
#
# Globals variables are prefixed '$gb_' and must be change.
#

class linux::params {

  ## Class: NTPdate 
  $gb_ntpserver = 'a.ntp.br'

  ## Class: TIMEZONE
  $gb_tz_timezone = 'America/Sao_Paulo'

  case $::osfamily {
    'Debian': {
      $gb_tz_package = 'tzdata'
      $gb_tz_zoneinfo_dir = '/usr/share/zoneinfo/'
      $gb_tz_localtime_file = '/etc/localtime'
      $gb_tz_timezone_file = '/etc/timezone'
      $gb_tz_timezone_file_template = 'linux/base/timezone/timezone.erb'
    }
    'RedHat': {
      $gb_tz_package = 'tzdata'
      $gb_tz_zoneinfo_dir = '/usr/share/zoneinfo/'
      $gb_tz_localtime_file = '/etc/localtime'
      $gb_tz_timezone_file = '/etc/sysconfig/clock'
      $gb_tz_timezone_file_template = 'linux/base/timezone/clock.erb'
    }
    'Gentoo': {
      $gb_tz_package = 'sys-libs/timezone-data'
      $gb_tz_zoneinfo_dir = '/usr/share/zoneinfo/'
      $gb_tz_localtime_file = '/etc/localtime'
      $gb_tz_timezone_file = '/etc/timezone'
      $gb_tz_timezone_file_template = 'linux/base/timezone.erb'
    }
    'Archlinux': {
      $gb_tz_package = 'tzdata'
      $gb_tz_zoneinfo_dir = '/usr/share/zoneinfo/'
      $gb_tz_localtime_file = '/etc/localtime'
      $gb_tz_timezone_file = false
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("#> Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }



}
