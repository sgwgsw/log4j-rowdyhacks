# log4j-rowdyhacks

1. run $ wget https://raw.githubusercontent.com/sgwgsw/log4j-rowdyhacks/main/Dockerfile
2. Go to the directory that Dockerfile was downloaded to, and run $ docker build -t tomcatlog4j2-app .
3. Create a docker network (for communications from container to container, or host)
      1. $ docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernetwork
4. The following docker run commands will mount the docker log files to your host machine current directory.
      1. Using CMD - $ docker run -d --rm -p 8088:8080 -v %cd%:/opt/tomcat/apache-tomcat-8.0.53/logs tomcatlog4j-app
      2. Using Powershell or linux - $ docker run -d --rm -p 8088:8080 -v ($pwd):/opt/tomcat/apache-tomcat-8.0.53/logs tomcatlog4j-app
5. Browse to http://127.0.0.1:8088
