FROM centos:latest
MAINTAINER Jason Zou <jason.zou@gmail.com>

RUN yum update -y
RUN yum install -y wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.rpm
RUN rpm -ivh jdk-8*-linux-x64.rpm && rm jdk-8*-linux-x64.rpm

ENV JAVA_HOME /usr/java/latest

RUN yum update -y && yum install -y unzip
RUN curl -O https://downloads.typesafe.com/typesafe-activator/1.3.10/typesafe-activator-1.3.10.zip
RUN unzip typesafe-activator-1.3.10.zip -d / && rm typesafe-activator-1.3.10.zip && chmod a+x /activator-dist-1.3.10/bin/activator
ENV PATH $PATH:/activator-dist-1.3.10:/activator-dist-1.3.10/bin

EXPOSE 9000 8888
RUN mkdir /app
WORKDIR /app

CMD ["activator", "run"]
