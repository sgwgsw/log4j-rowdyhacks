#The environment variable CLASSPATH is unset in catalina.sh/catalina.bat
CLASSPATH=/opt/tomcat/apache-tomcat-8.0.53/lib/log4j-api-2.14.0.jar:/opt/tomcat/apache-tomcat-8.0.53/lib/log4j-core-2.14.0.jar:/opt/tomcat/apache-tomcat-8.0.53/lib/log4j-jul-2.14.0.jar
JAVA_OPTS=-Dlog4j.configurationFile=/opt/tomcat/apache-tomcat-8.0.53/conf/log4j2.xml
LOGGING_MANAGER=-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
