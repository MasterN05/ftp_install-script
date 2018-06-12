#!/bin/bash
#version1.0 优斗士ftp服务安装脚本
yum install -y  vsftpd 
touch vsftpd.conf
echo  -e " anonymous_enable=NO\n local_enable=YES\n write_enable=YES\n local_umask=022\n dirmessage_enable=YES\n xferlog_enable=YES\n connect_from_port_20=YES\n xferlog_std_format=YES\n xferlog_std_format=YES\n xferlog_std_format=YES\n listen=NO\n listen_ipv6=YES\n pam_service_name=vsftpd\n userlist_enable=YES\n tcp_wrappers=YES\n " > vsftpd.conf
rm /etc/vsftpd/vsftpd.conf 2> /dev/null
cp  vsftpd.conf  /etc/vsftpd/vsftpd.conf
rm vsftpd.conf
systemctl restart vsftpd

#创建ftp用户
echo "正在创建ftp用户,名字：udows"
useradd -d /home/ftproot -s /sbin/nologin udows
passwd udows
chmod 777 /home/ftproot
systemctl restart vsftpd
systemctl enable vsftpd
systemctl enable vsftpd
