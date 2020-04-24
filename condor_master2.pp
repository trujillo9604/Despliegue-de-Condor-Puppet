node '192.168.20.49'{

class { 'ntp':
    servers => ['172.22.250.1']
  }



}
