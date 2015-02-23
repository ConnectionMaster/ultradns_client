# ultradns_client-cookbook

Provides ultadns_client LWRP for interaction with the UltraDNS API

## Resources and Providers
###ultradns_client
####Actions
<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Default</th>
    </tr>
  </thead>
  <tr>
    <td>create</td>
    <td>Create new record</td>
    <td>true</td>
  </tr>
  <tr>
    <td>update</td>
    <td>Update an existing record</td>
    <td>false</td>
  </tr>
  <tr>
    <td>delete</td>
    <td>Delete an existing record</td>
    <td>false</td>
  </tr>
</table>

####Parameters
<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Required</th>
      <th>Allowed Values</th>
    </tr>
  </thead>
  <tr>
    <td>username</td>
    <td>Neustar API username</td>
    <td>true</td>
    <td>Any</td>
  </tr>
  <tr>
    <td>password</td>
    <td>Neustar API password</td>
    <td>true</td>
    <td>Any</td>
  </tr>
  <tr>
    <td>zone</td>
    <td>DNS zone to modify. The zone must already exist on the account</td>
    <td>true</td>
    <td>Any</td>
  </tr>
  <tr>
    <td>record_name</td>
    <td>Record to be added / deleted / updated</td>
    <td>true</td>
    <td></td>
  </tr>
  <tr>
    <td>record_type</td>
    <td>A or CNAME</td>
    <td>false</td>
    <td>A, CNAME</td>
  </tr>
  <tr>
    <td>record_value</td>
    <td>IP or Record that the entry should point to</td>
    <td>false</td>
    <td></td>
  </tr>
  <tr>
    <td>ttl</td>
    <td>Time to live</td>
    <td>false</td>
    <td></td>
  </tr>
  <tr>
    <td>connection_options</td>
    <td>
      Hash of connection options. Currently supports only `host` for overriding the default API endpoint
    </td>
    <td>false</td>
    <td>{}</td>
  </tr>
</table>

####Examples
  `ultradns_client 'createtest' do
    username node['ultradns_client_test']['username']
    password node['ultradns_client_test']['password']
    zone 'api_test.com'
    record_name 'createtest'
    record_type 'A'
    record_value '127.0.0.1'
    ttl 500
    connection_options 'host' => 'test-restapi.ultradns.com'
    action :create
  end`

  ultradns_client 'update-test' do
   username node['ultradns_client_test']['username']
   password node['ultradns_client_test']['password']
   zone 'api_test.com'
   record_name 'update-test'
   record_type 'A'
   ttl 200
   action :update
  end

  ultradns_client 'delete-test' do
    username node['ultradns_client_test']['username']
    password node['ultradns_client_test']['password']
    zone 'api_test.com'
    record_name 'delete-test'
    record_type 'A'
    record_value '127.0.0.1'
    action :delete
  end

## Usage

### ultradns_client::default

Include `ultradns_client::default` recipe

###

## License and Authors

Author:: Brent Walker (<brent.walker@ge.com>)
