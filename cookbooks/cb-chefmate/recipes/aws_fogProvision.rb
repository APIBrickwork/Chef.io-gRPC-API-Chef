require 'fog'
connection = Fog::Compute.new(
  :provider => 'AWS',
  :region => "#{node['chefmate']['machine']['region']}",
  :aws_access_key_id => "#{node['chefmate']['aws']['credentials']['accesskey']}",
  :aws_secret_access_key => "#{node['chefmate']['aws']['credentials']['secretkey']}"
)

# get the security group
#sg = connection.security_groups.get_by_id('sg-79ae5d11')


# start a server
server = connection.servers.create(
	:username => "#{node['chefmate']['machine']['username']}",
	:image_id => "#{node['chefmate']['machine']['imageid']}",
	:tags => {Name: "#{node['chefmate']['machine']['name']}", Tag: "#{node['chefmate']['machine']['tag']}"},
	:flavor_id => "#{node['chefmate']['machine']['instancetype']}",
	:key_name => 'chefmateserver_key',
	:private_key_path => '~/.ssh/chefmateserver_key',
	:public_key_path => '~/.ssh/chefmateserver_key.pub',
	:security_group_ids => "#{node['chefmate']['machine']['defaultsecuritygroupdids']}"
)

# wait for it to get online
server.wait_for { ready? }

$publicDns = server.dns_name
puts "CHEFMATEINFO::PublicDNS=#$publicDns"

# instance id -> find it again
$instanceID = server.id
puts "CHEFMATEINFO::InstanceID=#$instanceID"