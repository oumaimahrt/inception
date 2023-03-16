#!/bin/bash

#Start the MYSQL service
service mysql start

#Create a SQL file for DataBase
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

#Execute the SQL file using mysql cmd 
mysql -u root < db1.sql

#Stop MYSQL service by killing the proccess ID in the path mentioned
kill $(cat /var/run/mysqld/mysqld.pid)

# service mysql stop


echo "mysql has been killed and started again"

#Start MYSQL service
mysqld
