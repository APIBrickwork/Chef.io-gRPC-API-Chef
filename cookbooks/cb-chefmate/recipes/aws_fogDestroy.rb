require 'fog'
connection = Fog::Compute.new(
  :provider => 'AWS',
  :region => "#{node['chefmate']['machine']['region']}",
  :aws_access_key_id => "#{node['chefmate']['aws']['credentials']['accesskey']}",
  :aws_secret_access_key => "#{node['chefmate']['aws']['credentials']['secretkey']}"
)

# Get a list of running servers
server = connection.servers.get("#{node['chefmate']['machine']['delete']['instanceid']}")

server.destroy;