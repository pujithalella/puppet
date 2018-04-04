class tomcat {

  package { 'glibc.i686':
    ensure  => installed,
  }

  file { '/opt/tomcat':
    ensure  => directory,
    require => Package['glibc.i686'],
  }

  exec { 'download_tomcat':
    path    => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin:/opt/puppetlabs/bin',
    command => 'wget http://mirror.its.dal.ca/apache/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.tar.gz',
    cwd     => '/opt/tomcat',
    creates => '/opt/tomcat/apache-tomcat-8.5.29.tar.gz',
    require => File['/opt/tomcat'],
  }

  exec { 'untar_tomcat':
    path    => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin:/opt/puppetlabs/bin',
    command => 'tar -xvf apache-tomcat-8.5.29.tar.gz',
    require => Exec['download_tomcat'],
    cwd     => '/opt/tomcat',
    creates => '/opt/tomcat/apache-tomcat-8.5.29',
  }

  exec { 'start_tomcat':
    path   => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin:/opt/puppetlabs/bin',
    environment  => ['JAVA_HOME=/opt/java/jdk1.8.0_161'],
    command  => '/opt/tomcat/apache-tomcat-8.5.29/bin/startup.sh',
    require  => Exec['untar_tomcat'] ,
  }   
}
include tomcat
