node '192.168.20.50',
     '192.168.20.48'

{

class { 'ntp':
    servers => ['172.22.250.1']
  }


#Añadir repositorio de HTCondor

    source => 'puppet:///files_ciat/condor_files/sources.list',
}

#Sobreescritura del archivo source.list

 exec { "CP_SOURCE": 
    command => '/bin/cp -rp /home/netsupport/sources.list /etc/apt/sources.list',
}

#Apt-get update de la lista de repositorios

 exec { "UPDATE":
   command => '/usr/bin/apt-get update'
}

#Recurso para instalar HTCondor

package { 'condor':
    ensure => '8.8*',
}

#Recurso para iniciar el servicio de HTCondor

service {'condor':
        ensure => running,
        ensure => running,
        enable => true,
}

#Recurso para modificar el archivo de configuracion de HTCONDOR

file { "/home/netsupport/condor_config.local":
 ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    source => 'puppet:///files_ciat/condor_files/condor_config_nodo.local',
}

#Sobreescritura del archivo de configuracion de condor

 exec { "CP_CONFIG": 
    command => '/bin/cp -rp /home/netsupport/condor_config.local /etc/condor',
}


#Modificar archivo HOSTS para añadir las IP´S de los nodos esclavos






}