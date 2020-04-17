#!/bin/bash

############################################################
#region removeStuff
systemctl stop admin-tester.socket
systemctl stop admin-tester.service
rm /run/admin-tester.sk
#endregion

############################################################
#region copyStuff
cp certificates/cert.pem /etc/nginx/ssl/cert.pem
cp certificates/key.pem /etc/nginx/ssl/key.pem
cp admin-tester.service /etc/systemd/system/
cp admin-tester.socket /etc/systemd/system/
cp nginx-config /etc/nginx/servers/admin-tester
#endregion

############################################################
#region reloadAndRestart
systemctl daemon-reload
systemctl start admin-tester.socket
nginx -s reload
#endregion
