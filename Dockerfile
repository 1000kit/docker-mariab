FROM centos/mariadb

MAINTAINER 1000kit <docker@1000kit.org>

LABEL Vendor="1000kit" \
      License=GPLv3 \
      Version=1.0.0

USER root
## install 1000kit base  tools
RUN  yum update -y \
   && yum -y install xmlstarlet saxon augeas bsdtar tar unzip curl wget less dos2unix gettext \
   && yum clean all\

   && curl -L https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 -o /usr/sbin/gosu \
   && chmod 0755 /usr/sbin/gosu ; chmod 755 /usr/sbin/gosu ; chmod u+s /usr/sbin/gosu
 

# By default will run as random user on openshift and the mysql user (27)
# everywhere else
USER 27

CMD ["mysqld_safe"]

#end
