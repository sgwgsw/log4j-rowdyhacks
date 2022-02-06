FROM openjdk:8-jdk-alpine

RUN mkdir /opt/tomcat
RUN mkdir /opt/apache

WORKDIR /opt/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
RUN tar -xvzf apache-tomcat-8.0.53.tar.gz
RUN rm apache-tomcat-8.0.53.tar.gz
RUN cd /opt/tomcat/apache-tomcat-8.0.53/bin
RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/tomcat-juli/8.0.53/tomcat-juli-8.0.53.jar
RUN mv tomcat-juli-8.0.53.jar tomcat-juli.jar
RUN cd /opt/tomcat/apache-tomcat-8.0.53/lib
RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/extras/tomcat-extras-juli-adapters/8.0.53/tomcat-extras-juli-adapters-8.0.53.jar
RUN mv tomcat-extras-juli-adapters-8.0.53.jar tomcat-juli-adapters.jar
RUN wget https://github.com/sgwgsw/log4j-rowdyhacks/blob/main/log4j.properties
RUN cd ..
RUN cd conf
RUN rm logging.properties
RUN rm tomcat-users.xml
RUN wget https://github.com/sgwgsw/log4j-rowdyhacks/blob/main/tomcat-users.xml


WORKDIR /opt/apache
RUN wget https://archive.apache.org/dist/logging/log4j/2.14.0/apache-log4j-2.14.0-bin.tar.gz
RUN tar -xvzf apache-log4j-2.14.0-bin.tar.gz
RUN cd apache-log4j-2.14.0-bin
RUN mv log4j-api-2.14.0.jar /opt/tomcat/apache-tomcat-8.0.53/lib
RUN mv log4j-core-2.14.0.jar /opt/tomcat/apache-tomcat-8.0.53/lib

CMD [ "catalina.sh", "run" ] 
