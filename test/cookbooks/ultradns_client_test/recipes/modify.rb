include_recipe 'ultradns_client::default'

ultradns_client 'update-test' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'update-test'
  record_type 'A'
  record_value '127.0.0.123'
  ttl 300
  connection_options :host => 'test-restapi.ultradns.com'
  action :create
end


ultradns_client 'update-test' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'update-test'
  record_type 'A'
  record_value '127.0.0.2'
  connection_options :host => 'test-restapi.ultradns.com'
  action :update
end


ultradns_client 'update-test' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'update-test'
  record_type 'A'
  ttl 200
  connection_options host: 'test-restapi.ultradns.com'
  action :update
end