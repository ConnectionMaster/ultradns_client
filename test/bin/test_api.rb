require 'ultradns-sdk'

def print_rrsets(zone, msg = '')
  puts msg
  zone.rrsets.parsed_response['rrSets'].each do |record|
    puts record unless record['rrtype'].match /(^SOA|^NS)/
  end
end

def get_zone(client)
  zone = client.zone('001api_test.com')
  metadata = zone.metadata.parsed_response

  if (request_failed(metadata))
    error = get_error(metadata)
    Chef::Log.error("Could not retrieve requested zone, #{new_resource.zone}, #{error['error_code']} : #{error['errorMessage']}")
    raise "Could not retrieve requested zone, #{new_resource.zone}, #{error['error_code']} : #{error['errorMessage']}"
  end

  zone
end

def request_failed(response, accepted_codes = [])
  if response.first.is_a?(Hash) && response.first['errorCode'] && !accepted_codes.find_index { |c| c == response.first['errorCode'] }
    true
  else
    false
  end
end

def build_ownername(record_name, zone)
  str = record_name.end_with?('.') ? record_name + zone : record_name + '.' + zone
  zone.end_with?('.') ? str : str + '.'
end

owner_name = build_ownername('default-test', '001api_test.com')
puts owner_name

client = Ultradns::Client.new(ENV['ULTRADNS_USERNAME'], ENV['ULTRADNS_PASSWORD'], host: 'test-restapi.ultradns.com')
zone = get_zone(client)


response = zone.rrset('CNAME', 'test-cname').create(300, ['default-test'])
puts response
print_rrsets(zone, 'testupdate = 127.0.0.1, 300')
#
# response = zone.rrset('A', 'testupdate').update(600)
#
# print_rrsets(zone, 'testupdate = 127.0.0.1, 600')
#
# response = zone.rrset('A', 'testupdate').update(600, ['127.0.0.2'])
#
# print_rrsets(zone, 'testupdate = 127.0.0.2, 600')
#
# response = zone.rrset('A', 'testupdate').update(600, ['127.0.0.3','127.0.0.4'])
#
# print_rrsets(zone, 'testupdate = 127.0.0.3, 4, 600')
#
# response = zone.rrset('CNAME', 'testupdate').update(600, ['127.0.0.1'])
#
# print_rrsets(zone, 'no CNAME for testupdate')

# print_rrsets(zone, 'before delete')
# response = zone.rrset('a', 'delete-test').delete
#
# print_rrsets(zone, 'deleted testupdate')