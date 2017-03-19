# frozen_string_literal: true
name 'rabbitmq'
maintainer 'Chef, Inc.'
maintainer_email 'jj@chef.io'
license 'Apache 2.0'
description 'Installs and configures RabbitMQ server'
version '4.12.0'
recipe 'rabbitmq', 'Install and configure RabbitMQ'
recipe 'rabbitmq::cluster', 'Set up RabbitMQ clustering.'
recipe 'rabbitmq::plugin_management', 'Manage plugins with node attributes'
recipe 'rabbitmq::virtualhost_management', 'Manage virtualhost with node attributes'
recipe 'rabbitmq::user_management', 'Manage users with node attributes'

issues_url 'https://github.com/rabbitmq/chef-cookbook/issues'
source_url 'https://github.com/rabbitmq/chef-cookbook'

depends 'erlang'
depends 'yum-epel'
depends 'yum-erlang_solutions'
depends 'dpkg_autostart'

supports 'centos', '>= 7.0'
supports 'debian', '>= 8.0'
supports 'opensuse'
supports 'opensuseleap'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'smartos'
supports 'suse'
supports 'ubuntu', '>= 14.04'
