#
# Cookbook Name:: ultradns_client
# Recipe:: default
#
# Copyright (C) 2015 General Electric
#
# All rights reserved - Do Not Redistribute
#

chef_gem 'ultradns-sdk' do
  action :nothing
end.run_action(:install)

require 'ultradns-sdk'