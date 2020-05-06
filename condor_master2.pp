node '192.168.20.49'{


class { 'ntp':
    servers => ['172.22.250.1']
  }
  

#Añadir IPS al archivo hosts

file { "/home/netsupport/hosts":
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    source => 'puppet:///files_ciat/condor_files/hosts',
}

#Sobreescritura del archivo hosts

 exec { "CP_HOSTS": 
    command => '/bin/cp -rp /home/netsupport/hosts /etc/hosts',
}


#Añadir repositorio de HTCondor

file { "/home/netsupport/sources.list":
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
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


#Recurso para modificar el archivo de configuracion de HTCONDOR

file { "/home/netsupport/condor_config.local":
 ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    source => 'puppet:///files_ciat/condor_files/condor_config_master.local',
}

#Sobreescritura del archivo de configuracion de condor

 exec { "CP_CONFIG": 
    command => '/bin/cp -rp /home/netsupport/condor_config.local /etc/condor',
}


#Recurso para modificar el archivo de configuracion de HTCONDOR y asignar su IP correspondiente 

file { "/home/netsupport/add_ip.sh":
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    source => 'puppet:///files_ciat/condor_files/add_ip.sh',
}


exec {"IP_CONFIG":
   command => '/bin/sh /home/netsupport/add_ip.sh',
}


#Recurso para iniciar el servicio de HTCondor

service {'condor':
        ensure => running,
        enable => true,
}


#Modificar archivo HOSTS para añadir las IP´S de los nodos esclavos no fue necesario


}
