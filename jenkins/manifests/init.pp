# Class: jenkins
# ===========================
#
# Full description of class jenkins here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'jenkins':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class jenkins {

  package { 'libgcc_s.so.1':
    ensure  => installed,
  }

  exec { 'download_jenkins_war':
    path  => '/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin:/opt/puppetlabs/bin',
    command  => 'wget https://updates.jenkins-ci.org/download/war/2.114/jenkins.war',
    creates  => '/opt/tomcat/apache-tomcat-8.5.29/webapps/jenkins.war',
    cwd      => '/opt/tomcat/apache-tomcat-8.5.29/webapps',
    require  => Package['libgcc_s.so.1']
  }
}

include jenkins
