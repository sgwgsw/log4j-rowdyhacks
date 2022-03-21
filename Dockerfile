FROM tomcat:8.0.53-jre8

#FROM openjdk:8u102-jdk

#RUN mkdir /opt/tomcat
#RUN groupadd tomcat
#RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
#RUN chgrp -R tomcat /opt/tomcat
#RUN chmod -R g+r /opt/tomcat
#RUN chmod g+x /opt/tomcat
#RUN chown -R tomcat /opt/tomcat

WORKDIR /tmp
#RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/log4j2.xml
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/server.xml
RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/setenv.sh
#RUN wget https://raw.githubusercontent.com/sgwgsw/tomcat-log4j2/main/tomcat.service
#RUN tar -xvzf apache-tomcat-8.0.53.tar.gz -C /opt/tomcat --strip-components=1
#RUN rm apache-tomcat-8.0.53.tar.gz
RUN rm /usr/local/tomcat/conf/logging.properties
RUN mv log4j2.xml /usr/local/tomcat/conf
RUN mv server.xml /usr/local/tomcat/conf
RUN mv setenv.sh /usr/local/tomcat/bin

#RUN mv /tmp/tomcat.service /etc/systemd/system/tomcat.service
# RUN systemctl daemon-reload
# RUN systemctl start tomcat.service

RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/tomcat-juli/8.0.53/tomcat-juli-8.0.53.jar
RUN mv tomcat-juli-8.0.53.jar /usr/local/tomcat/tomcat-juli.jar

RUN wget https://repo1.maven.org/maven2/org/apache/tomcat/extras/tomcat-extras-juli-adapters/8.0.53/tomcat-extras-juli-adapters-8.0.53.jar
RUN mv tomcat-extras-juli-adapters-8.0.53.jar /usr/local/tomcat/lib/tomcat-juli-adapters.jar


RUN wget https://archive.apache.org/dist/logging/log4j/2.14.0/apache-log4j-2.14.0-bin.tar.gz
RUN tar -xvzf apache-log4j-2.14.0-bin.tar.gz
RUN mv apache-log4j-2.14.0-bin/log4j-api-2.14.0.jar /usr/local/tomcat/lib
RUN mv apache-log4j-2.14.0-bin/log4j-core-2.14.0.jar /usr/local/tomcat/lib
RUN mv apache-log4j-2.14.0-bin/log4j-jul-2.14.0.jar /usr/local/tomcat/lib
RUN rm apache-log4j-2.14.0-bin.tar.gz

#RUN chmod +x /opt/tomcat/bin/startup.sh

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
