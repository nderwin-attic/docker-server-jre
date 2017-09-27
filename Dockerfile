FROM	debian:stretch

LABEL	Author="Nathan Erwin <nathan.d.erwin@gmail.com>"

# install the JRE
ENV	JAVA_HOME=/opt/jdk-9 \
	JAVA_VERSION=9 \
	JAVA_BUILD_VERSION=181 

RUN	DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get -y install curl \
	&& cd /opt \
	&& curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION+$JAVA_BUILD_VERSION/serverjre-"$JAVA_VERSION"_linux-x64_bin.tar.gz | tar zx \ 
	&& chown -R root:root $JAVA_HOME \ 
	&& ln -s $JAVA_HOME/bin/java /usr/bin/java

