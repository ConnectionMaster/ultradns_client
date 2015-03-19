#
# Cookbook Name:: ultradns_client
# Recipe:: default
#
# Copyright (C) 2015 General Electric
#
# All rights reserved - Do Not Redistribute
#

chef_gem 'ultradns-sdk' do
  version '0.0.6'
  compile_time true if Chef::Resource::ChefGem.method_defined?(:compile_time)
  action :nothing
end.run_action(:install)

require 'ultradns-sdk'