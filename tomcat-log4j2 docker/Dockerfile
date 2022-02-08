FROM openjdk:8-jdk-alpine

RUN mkdir /opt/tomcat
RUN mkdir /opt/apache

WORKDIR /opt/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
RUN tar -xvzf apache-tomcat-8.0.53.tar.gz
RUN rm apache-tomcat-8.0.53.tar.gz
RUN rm /opt/tomcat/apache-tomcat-8.0.53/conf/logging.properties
RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/tomcat-juli/8.0.53/tomcat-juli-8.0.53.jar
RUN mv tomcat-juli-8.0.53.jar /opt/tomcat/apache-tomcat-8.0.53/bin/tomcat-juli.jar
WORKDIR /opt/tomcat/apache-tomcat-8.0.53/lib
RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/extras/tomcat-extras-juli-adapters/8.0.53/tomcat-extras-juli-adapters-8.0.53.jar
RUN mv tomcat-extras-juli-adapters-8.0.53.jar tomcat-juli-adapters.jar
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/log4j2.xml
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/server.xml
RUN mv log4j2.xml /opt/tomcat/apache-tomcat-8.0.53/conf
RUN mv server.xml /opt/tomcat/apache-tomcat-8.0.53/conf
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/setenv.sh
RUN mv setenv.sh /opt/tomcat/apache-tomcat-8.0.53/bin

WORKDIR /opt/apache
RUN wget https://archive.apache.org/dist/logging/log4j/2.14.0/apache-log4j-2.14.0-bin.tar.gz
RUN tar -xvzf apache-log4j-2.14.0-bin.tar.gz
RUN mv /opt/apache/apache-log4j-2.14.0-bin/log4j-api-2.14.0.jar /opt/tomcat/apache-tomcat-8.0.53/lib
RUN mv /opt/apache/apache-log4j-2.14.0-bin/log4j-core-2.14.0.jar /opt/tomcat/apache-tomcat-8.0.53/lib
RUN mv /opt/apache/apache-log4j-2.14.0-bin/log4j-jul-2.14.0.jar /opt/tomcat/apache-tomcat-8.0.53/lib

CMD ["/opt/tomcat/apache-tomcat-8.0.53/bin/catalina.sh", "run"]
