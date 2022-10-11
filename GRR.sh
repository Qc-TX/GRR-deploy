
echo '############[更改Mysqld设置]###################################################'
echo "[mysqld]
max_allowed_packet=40M" >> /etc/mysql/my.cnf
echo '############[重新启动MySQL服务器:]#############################################'
service mysql restart
echo '############[为 GRR 创建一个新的数据库用户]####################################'
mysql -u root -p
echo ' '
echo '############[下载最新的服务器 deb：]###########################################'
wget https://storage.googleapis.com/releases.grr-response.com/grr-server_3.4.6-0_amd64.deb
echo '############[INSTALL最新的服务器 deb：]########################################'
sudo apt install -y ./grr-server_3.4.6-0_amd64.deb
echo '############[启动GRR服务]######################################################'
grr-server fleetspeak-server
echo '############[查看GRR服务状态]##################################################'
systemctl status grr-server

