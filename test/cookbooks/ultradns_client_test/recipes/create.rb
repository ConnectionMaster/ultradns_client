include_recipe 'ultradns_client::default'

num = Random.new.rand(50)

ultradns_client 'createtest' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name "createtest#{num}"
  record_type 'A'
  record_value '127.0.0.1'
  ttl 500
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :create
end

ultradns_client 'createtestref' do
  username node['ultradns_client_test']['username']
  password node['ultradns_client_test']['password']
  zone '001api_test.com'
  record_name "createtestref#{num}"
  record_type 'CNAME'
  record_value "createtest#{num}.001api_test.com"
  ttl 500
  connection_options 'host' => 'test-restapi.ultradns.com'
  action :create
end