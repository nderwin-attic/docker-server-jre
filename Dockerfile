FROM	debian:jessie

LABEL	Author="Nathan Erwin <nathan.d.erwin@gmail.com>"

# install the JRE
ENV	JAVA_HOME=/opt/jdk1.8.0_152 \
	JAVA_VERSION=8u152 \
	JAVA_BUILD_VERSION=b16 \
	TOKEN=aa0333dd3019491ca4f6ddbe78cdb6d0

RUN	DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get -y install curl \
	&& cd /opt \
	&& curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/$TOKEN/server-jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx \ 
	&& chown -R root:root $JAVA_HOME \ 
	&& ln -s $JAVA_HOME/bin/java /usr/bin/java
