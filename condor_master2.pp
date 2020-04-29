node '192.168.20.49'{


class { 'ntp':
    servers => ['172.22.250.1']
  }

#Añadir repositorio de HTCondor

file { "/home/netsupport/sources.list":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644,
    source => 'puppet:///files_ciat/condor_files/sources.list',
}
# exec { "
    
    
#}



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
#service {'condor':
#    ensure => running,
#}

#Recurso para modificar el archivo de configuracion de HTCONDOR

#file { '/etc/condor/condor_config.local':
#    content => "         \n", "           \n", 
#}




}
