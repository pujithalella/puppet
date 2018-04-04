class profile::jenkins::install {
  contain java
  contain tomcat
  contain jenkins

  Class['java'] -> Class['tomcat'] -> Class['jenkins']
}
include profile::jenkins::install
