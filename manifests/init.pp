# Author::    Liam Bennett (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class: puppetdb_rundeck
#
# A module that will manage and install the puppetdb_rundeck ruby gem
#
# === Requirements/Dependencies
#
# Currently reequires the puppetlabs/stdlib module on the Puppet Forge in
# order to validate much of the the provided configuration.
#
# === Parameters
#
# [*service_name*]
# The name of the service that will be used to start/stop this application
#
# [*version*]
# The version of the gem to install
#
# [*puppetdb_host*]
# The PuppetDB host that the application should talk to.
#
# [*puppetdb_port*]
# The port the configured PuppetDB host is configured to run on.
#
# [*port*]
# The port to run the puppetdb_rundeck application on
#
# === Examples
#
# To install puppetdb_rundeck:
#
#
#   puppetdb_rundeck { 'puppetdb_rundeck':
#     version => '0.1.0'
#   }
#
# To install puppetdb_rundeck on a different port:
#
#   puppetdb_rundeck { 'puppetdb_rundeck':
#     version => '0.1.0',
#     port    => '9090'
#   }
#
# To install puppetdb_rundeck on a system with an external host:
#
#   puppetdb_rundeck { 'puppetdb_rundeck':
#     version => '0.1.0',
#     puppetdb_host => 'anotherhost.somedomain.com',
#     puppetdb_post => '8081'
#   }
#
class puppetdb_rundeck (
  $service_name    = $puppetdb_rundeck::params::service_name,
  $version         = $puppetdb_rundeck::params::version,
  $puppetdb_host   = $puppetdb_rundeck::params::puppetdb_host,
  $puppetdb_port   = $puppetdb_rundeck::params::puppetdb_post,
  $port            = $puppetdb_rundeck::params::port,
  $thread_count    = $puppetdb_rundeck::params::thread_count,
  $cache_timeout   = $puppetdb_rundeck::params::cache_timeout,
  $short_nodenames = $puppetdb_rundeck::params::short_nodenames,
) inherits puppetdb_rundeck::params {

  # validate parameters here

  class { 'puppetdb_rundeck::install': } ->
  class { 'puppetdb_rundeck::service': } ->
  Class['puppetdb_rundeck']
}
