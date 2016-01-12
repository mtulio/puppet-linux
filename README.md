# Linux

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with linux](#setup)
    * [What linux affects](#what-linux-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with linux](#beginning-with-linux)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module is a 'all-in-one' module to manage main Linux configurations including basic and security options

## Module Description

This module is a 'all-in-one' module to manage main Linux configurations, that includes:

Security administration:
* SELinux config
 
Basic Sysadmin administration:
* motd
* ntpdate
* hosts
* timezone
* resolv.conf


## Setup

### What 'linux' affects

* This module can change all the comportament of the Linux Operational System,
  mostly the security classes

### Setup Requirements 

Class 'iptables' depends of module:
* firewall

### Beginning with 'linux'

This is a great module to configure your OS Linux. This module can be called from a 
profile module, and it was created to be easy to manage the simple Linux configurations.

## Usage

Check usage of each class: 


### Base Class: NTPdate

* Schedulle at contab an ntpdate execution using custom ntp servers:
 ~~~
class {'linux::base::ntpdate' :
  ntpserver => 'pool.ntp.br',
}
 ~~~

### Base Class: MOTD

* Create a default 'Message of the Day':
 ~~~
class {'linux::base::motd' : }
 ~~~

* Create a custom message:
 ~~~
class {'linux::base::motd' : 
  content => 'Custom motd message',
}
 ~~~

* Create a custom esb template file:
 ~~~
class {'linux::base::motd' :
  content => 'custom/path/to/motd.esb',
}

### Base Class: HOSTS

* Update hots file:
 ~~~
class {'linux::base::hosts' : }
 ~~~

### Base Class: TIMEZONE

* Update system timezone, using default timezone [linux::params]:
 ~~~
class {'linux::base::timezone' : }
 ~~~

* Update system timezone from system, usgin custom timezone:
 ~~~
class {'linux::base::timezone' : 
  timezone => 'America/Recife',
}
 ~~~

### Base Class: RESOLV_CONF

* Update /etc/resolv.conf from [linux::params]:
 ~~~
class {'linux::base::resolv_conf' : }
 ~~~

* Update /etc/resolv.conf of custom servers:
 ~~~
class {'linux::base::resolv_conf' : 
  nameservers = ['8.8.8.8'],
}
 ~~~


### Security Class: SELinux

* Set to permissive mode:
 ~~~
class {'linux::security::selinux' :
  mode => permissive,
}
 ~~~

* Set to enforced mode:
 ~~~
class {'linux::security::selinux' :
  mode => enforced,
}
 ~~~

* Set to 'disabled' mode:
 ~~~
class {'linux::security::selinux' :
  mode => disabled,
}
 ~~~

* Config from your own custom template:
 ~~~
class {'linux::security::selinux' :
  template_conf => 'module/selinux/config.erb',
}
 ~~~


## Reference

### Base Class: NTPdate

* Description: Schedulle to update System Time using ntpdate
* Default ntp server: 'a.ntp.br'
* Files affected: 

 ~~~
/etc/crontab
 ~~~

### Base Class: MOTD

* Description: Create a custom 'Message of the Day'
* Files affected: 

 ~~~
/etc/motd
 ~~~

### Base Class: Hosts

* Description: Update hosts file with your local IP address and domain
* Files affected: 

 ~~~
/etc/hosts
 ~~~

### Base Class: TIMEZONE

* Description: Update system timezone
* Files affected: 

 ~~~
/etc/localtime
/etc/timezone
 ~~~

### Base Class: RESOLV_CONF

* Description: Update DNS local resolver configuration
* Files affected: 

 ~~~
/etc/resolv.conf
 ~~~




### Security Class: SELinux

* Description: Configure SELinux to enforcing, permissive or disabled mode
* Files affected: 

 ~~~
/etc/selinux/config
 ~~~

## Limitations

OS compatibility: 
* Red Hat family 7+ 

We're working to support more OS.

## Development

See project page at https://github.com/mtulio/puppet-linux

## Release Notes

[0.1.0]
* Add class security::selinux 
* Add class base::ntpdate

