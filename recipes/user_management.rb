# -*- coding: utf-8 -*-
# frozen_string_literal: true
#
# Cookbook Name:: rabbitmq
# Recipe:: user_management
#
# Copyright 2013, Grégoire Seux
# Copyright 2013, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::virtualhost_management'

node['rabbitmq']['enabled_users'].each do |user|
  rabbitmq_user "add-#{user['name']}" do
    user user['name']
    password user['password']
    action :add
  end
  rabbitmq_user "set-tags-#{user['name']}" do
    user user['name']
    tag user['tag']
    action :set_tags
  end
  user['rights'].each do |r|
    rabbitmq_user "set-perms-#{user['name']}-vhost-#{Array(r['vhost']).join().gsub('/','_')}" do
      user user['name']
      vhost r['vhost']
      permissions "#{r['conf']} #{r['write']} #{r['read']}"
      action :set_permissions
    end
  end
end

node['rabbitmq']['disabled_users'].each do |user|
  rabbitmq_user "delete-#{user}" do
    user user
    action :delete
  end
end
