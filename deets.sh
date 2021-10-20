#!/bin/bash

domain=$1
domain_inf=$(whois $1)
echo "#########################################"
echo "####REGISTRY/REGISTRAR/REGISTRANT INFO###"
echo "#########################################"
echo "$domain_inf" | grep -i 'registrant:\|registry expiry date:\|registrant name:\|name server:\|status:'
echo "#########################################"
echo "###        HOSTING INFORMATION        ###"
echo "#########################################"
get_host_ip=$(host $1 | grep -i has)
host_id=$(host $1 | grep -i has | awk '{print $4}')
echo $get_host_ip && whois $host_id | grep -i 'org:\|name:\|net:'
