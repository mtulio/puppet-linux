# == Class: linux::security::selinux
#
# This module manages the /etc/motd file using a template
#
class linux::base::motd (
  $template = undef,
  $content  = undef,
) {

  if $::kernel == 'Linux' {
    if $template {
      if $content {
        warning('Both $template and $content parameters passed to motd, ignoring content')
      }
      $motd_content = template($template)
    }
    elsif $content {
      $motd_content = $content
    }
    else {
      $motd_content = template('linux/base/motd/motd.erb')
    }

    file { '/etc/motd':
      ensure  => file,
      backup  => false,
      content => $motd_content,
    }
  }
}
