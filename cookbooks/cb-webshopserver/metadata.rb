name             'cb-webshopserver'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures cb-webshopserver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'cb-webshopserver::default', 'Creates an AWS instance and installs the webshopserver'
recipe 'cb-webshopserver::webshopserver', 'Hosts the webshopserver on AWS.'

depends 'java', '~> 1.39.0'
