# log4j-rowdyhacks

1. run $ wget https://raw.githubusercontent.com/sgwgsw/log4j-rowdyhacks/main/Dockerfile
2. Go to the directory that Dockerfile was downloaded to, and run $ docker build -t tomcatlog4j2-app .
3. The following docker run commands will mount the docker log files to your host machine current directory.
      1. Using CMD - $ docker run -d --rm -p 8088:8080 -v %cd%:/opt/tomcat/apache-tomcat-8.0.53/logs tomcatlog4j-app
      2. Using Powershell or linux - $ docker run -d --rm -p 8088:8080 -v ($pwd):/opt/tomcat/apache-tomcat-8.0.53/logs tomcatlog4j-app
4. Browse to http://127.0.0.1:8088
