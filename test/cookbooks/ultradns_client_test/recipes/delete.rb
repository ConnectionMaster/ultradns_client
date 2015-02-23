include_recipe 'ultradns_client::default'

ultradns_client 'delete-test-create-a' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'delete-test-a'
  record_type 'A'
  record_value '127.0.0.1'
  ttl 500
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :create
end

ultradns_client 'delete-test-delete-a' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'delete-test-a'
  record_type 'A'
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :delete
end

ultradns_client 'delete-cname-create-cname' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'delete-test-cname.001api_test.com.'
  record_type 'CNAME'
  record_value 'something.001api_test.com'
  ttl 500
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :create
end

ultradns_client 'delete-cname-delete-cname' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name 'delete-test-cname'
  record_type 'CNAME'
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :delete
end