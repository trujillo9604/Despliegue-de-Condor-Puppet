node '192.168.20.49'{

class { 'ntp':
    servers => ['172.22.250.1']
  }

apt:source { 'HTCondor':
    comment => 'Repositorio de HTCondor',
    location => 'http://research.cs.wisc.edu/htcondor/debian/stable/',
    release  => 'main',
    repos    => '   ',
    pin      => '   ',
    
    key      => {
    'id'     => '      ',
    'server' => '      ',
  },
  
  include  => {
    'src' => true,
    'deb' => true,
  },
}


package { 'HTCondor':
    ensure => installed,
    name   => "condor",
}



service {'Condor Service':
    ensure => running,
    name => "condor",
}


}
