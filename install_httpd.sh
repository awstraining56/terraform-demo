#!/bin/bash
yum update -y
yum install httpd -y
echo $HOSTNAME "<h1> deploy using httpd from</h1>" >> /var/www/html/index.html
systemctl enable httpd
systemctl restart httpd
