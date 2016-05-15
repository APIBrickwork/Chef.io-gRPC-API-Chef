#
# Cookbook Name:: Chefmate
# Attributes:: default
#

# Default values used if nothing else is specified
default['chefmate']['machine']['name'] = 'chefmate'
default['chefmate']['machine']['tag'] = 'chefmate-tag'
default['chefmate']['machine']['region'] = 'eu-central-1'
default['chefmate']['machine']['imageid'] = 'ami-87564feb'
default['chefmate']['machine']['instancetype'] = 't2.micro'
default['chefmate']['machine']['defaultsecuritygroupdids'] = 'sg-79ae5d11'



# Overwrite via normal with user specific values!!