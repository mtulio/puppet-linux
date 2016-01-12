# Test of class ntpdate
class { 'linux::base::ntpdate' : 
  ntpserver => 'pool.ntp.br',
}
