node '192.168.20.49'{


class { 'ntp':
    servers => ['172.22.250.1']
  }

#Añadir repositorio de HTCondor

file { "/etc/apt/source.list":
    content => ' deb [arch=amd64]  http://research.cs.wisc.edu/htcondor/ubuntu/8.8/bionic  wheezy contrib ', 
    replace => true,
}


class { 'apt':
    update => {
        frequency => 'daily',
        loglevel =>  'debug' ,
    },
}


#Recurso para instalar HTCondor
#package { 'htcondor':
#    ensure => '8.8',
#    name   => "condor",
#}

#Recurso para iniciar el servicio de HTCondor
#service {'Condor Service':
#    ensure => running,
#      name => "condor",
#}

#Recurso para modificar el archivo de configuracion de HTCONDOR

#file { '/etc/condor/condor_config.local':
#    content => "         \n", "           \n", 
#}




}
