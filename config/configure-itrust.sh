#!/usr/bin/env bash

# Extract iTrust WAR
mkdir webapps/iTrust
unzip webapps/iTrust.war -d webapps/iTrust

# Provide correct MySQL connection information to Tomcat (variable is provided by Docker image)
sed -i -e "s/localhost/$MYSQL_PORT_3306_TCP_ADDR/g" webapps/iTrust/META-INF/context.xml

# Wait for MySQL to start
echo "Waiting for MySQL to start "
while ! nc -w 1 $MYSQL_PORT_3306_TCP_ADDR 3306 2>/dev/null
do
  echo -n .
  sleep 1
done

# Create iTrust database tables
cat webapps/iTrust/WEB-INF/classes/sql/createTables.sql | mysql -h $MYSQL_PORT_3306_TCP_ADDR itrust

# Load database with test data
cat webapps/itrust-test-data-files.txt | awk '{print "webapps/iTrust/WEB-INF/classes/sql/data/" $0}' | xargs cat | mysql -h $MYSQL_PORT_3306_TCP_ADDR itrust

# Start Tomcat server
catalina.sh run
