# docker-mariab

Based on CentOS7 original mariadb Dockerfile, based on centos/mariadb
`https://hub.docker.com/r/centos/mariadb/`

## additional installed packages

* xmlstarlet 
* saxon 
* augeas 
* bsdtar 
* tar 
* unzip 
* curl 
* wget 
* less 
* dos2unix 
* gettext
* gosu


## build
Take a Dockerfile and build with the default arguments:

~~~~
$ docker build -t 1000kit/maridb .
~~~~

or simply use the `build.sh` script

## run

~~~~
$ docker run --name=mariadb -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=<password> 1000kit/mariadb
~~~~

for persistence use a data volume and run:
* data volume container:
~~~~
$ docker run --name=mariadb-data -v /var/lib/mysql 1000kit/mariadb55 true
~~~~

* mysql using data volume:
~~~~
$ docker run --name=mariadb -d -p 3306:3306 --volumes-from=mariadb-data -e MYSQL_ROOT_PASSWORD=<password> 1000kit/mariadb
~~~~

* initial password:
Keep in mind the initial password set for mariadb is: mysqlPassword. 

