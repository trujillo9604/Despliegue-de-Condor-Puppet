node '192.168.20.49'{

class { 'ntp':
    servers => ['172.22.250.1']
  }

apt:source { 'HTCondor':
    comment => 'Repositorio de HTCondor',
    location => 'http://research.cs.wisc.edu/htcondor/debian/stable/',
    release  => 'unstable',
    repos    => 'main contrib non-free',
    pin      => '-10',
    
    key      => {
    'id'     => 'A1BD8E9D78F7FE5C3E65D8AF8B48AD6246925553',
    'server' => 'subkeys.pgp.net',
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
