#!/bin/sh 

#ɾ����ʱ�ű����޸�����
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/crontabs/$http_username

#ɾ�������ļ���
rm -rf /etc/dnsmasq.d/dnsfq.conf
rm -rf /etc/dnsmasq.d/ip.conf
rm -rf /etc/dnsmasq.d/union.conf

#����dnsmasq
/etc/init.d/dnsmasq restart

echo " �ѻ�ԭ"