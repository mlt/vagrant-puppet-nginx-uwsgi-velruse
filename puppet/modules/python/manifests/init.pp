class python {
    include python::packages

    package { 'python':
        ensure => installed,
    }
}

class python::packages {
    $apt = ['python-dev', 'build-essential', 'python-pip', 'python-redis', 'redis-server' ]
    $pip = ['velruse', 'Paste', ] # 'waitress', 'flask', ]

    package { $apt:
        require => Class['python'],
        ensure => installed,
    }

    package { $pip:
        require => Class['python'],
        ensure => installed,
        provider => pip,
    }
}
