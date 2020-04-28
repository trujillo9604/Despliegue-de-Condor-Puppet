node '192.168.20.49'{

include update 

class { 'ntp':
    servers => ['172.22.250.1']
  }

#Añadir repositorio de HTCondor

apt::source { "archive.ubuntu.com-${lsbdistcodename}":
  location => 'http://archive.ubuntu.com/ubuntu',
  key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
  repos    => 'main universe multiverse restricted',
}

apt::source { "archive.ubuntu.com-${lsbdistcodename}-security":
  location => 'http://archive.ubuntu.com/ubuntu',
  key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
  repos    => 'main universe multiverse restricted',
  release  => "${lsbdistcodename}-security"
}

apt::source { "archive.ubuntu.com-${lsbdistcodename}-updates":
  location => 'http://archive.ubuntu.com/ubuntu',
  key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
  repos    => 'main universe multiverse restricted',
  release  => "${lsbdistcodename}-updates"
}

apt::source { "archive.ubuntu.com-${lsbdistcodename}-backports":
 location => 'http://archive.ubuntu.com/ubuntu',
 key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
 repos    => 'main universe multiverse restricted',
 release  => "${lsbdistcodename}-backports"
}

apt::source { "http://research.cs.wisc.edu/htcondor/debian/stable-${lsbdistcodename}":
 location => 'http://research.cs.wisc.edu/htcondor/debian/stable/',
 key      => undef,
 repos    => 'main',
 release  => "${lsbdistcodename}"
}

#Recurso para instalar HTCondor
package { 'HTCondor':
    ensure => installed,
    name   => "condor",
}

#Recurso para iniciar el servicio de HTCondor
service {'Condor Service':
    ensure => running,
    name => "condor",
}


}
