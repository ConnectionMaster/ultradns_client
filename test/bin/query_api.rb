require 'ultradns-sdk'

def print_rrsets(zone, msg = '')
  puts msg
  zone.rrsets.parsed_response['rrSets'].each do |record|
    # puts record unless record['rrtype'].match /(^SOA|^NS)/
    puts record
  end
end

begin
  puts "u:#{ENV['ULTRADNS_USERNAME']} p:#{ENV['ULTRADNS_PASSWORD']}"
  client = Ultradns::Client.new(ENV['ULTRADNS_USERNAME'], ENV['ULTRADNS_PASSWORD'], host: 'test-restapi.ultradns.com')
  zone = print_rrsets(client.zone('001api_test.com'))
rescue
  puts $!
end