class java {

  file { '/opt/java':
    ensure  => directory,
  }

  exec { 'download_java':
    path     => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin',
    command  => 'wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-i586.tar.gz',
    cwd      => '/opt/java',
    require  => File['/opt/java'],
    creates  => '/opt/java/jdk-8u161-linux-i586.tar.gz',
  }

  exec { 'untar_java_1.8':
    path    => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin',
    cwd     => '/opt/java',
    require => Exec['download_java'],
    command => 'tar -xvf jdk-8u161-linux-i586.tar.gz',
    creates => '/opt/java/jdk1.8.0_161',
  }

}
