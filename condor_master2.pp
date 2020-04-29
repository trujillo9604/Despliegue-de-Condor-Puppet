node '192.168.20.49'{


class { 'ntp':
    servers => ['172.22.250.1']
  }

#Añadir repositorio de HTCondor

file { "/etc/apt/source.list":
    ensure => present,
    replace => true,
    content => "\n deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted \n deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
                \n deb http://us.archive.ubuntu.com/ubuntu/ xenial universe \n deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe
                \n deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse \n deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse
                \n deb http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse \n deb http://security.ubuntu.com/ubuntu xenial-security main restricted
                \n deb http://security.ubuntu.com/ubuntu xenial-security universe \n deb http://security.ubuntu.com/ubuntu xenial-security multiverse
                \n deb [arch=amd64]  http://research.cs.wisc.edu/htcondor/ubuntu/8.8/bionic  wheezy contrib \n",
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
#service {'condor':
#    ensure => running,
#}

#Recurso para modificar el archivo de configuracion de HTCONDOR

#file { '/etc/condor/condor_config.local':
#    content => "         \n", "           \n", 
#}




}
