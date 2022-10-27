#!/bin/bash

## Sonarqube install on centos 7
## Please run this as a user vagrant

###........(NB: Some servers have firewall enabled. So if you are not able to connect from the browser.) 

user_name=`whoami`

if [ $user_name != vagrant ];

then

echo "Run this script as a user vagrant !!!!"
exit 1
fi

echo "starting sonarqube installation ..............."

sleep 2

sudo yum update -y 

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

cd /opt

sudo yum install wget unzip -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

sudo yum install unzip -y    ## (If unzip is not installed on your system, run the command )

sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/

sudo firewall-cmd --permanent --add-port=9000/tcp ####.......(1)Run this commamd to open your port if disable)
sudo firewall-cmd --reload                        ####.......(2)Run this commamd to open your port if disable)
 ./sonar.sh start
 ./sonar.sh status

 
echo "Installation done successfully please get the IP and access your sonarqube on the browser"
