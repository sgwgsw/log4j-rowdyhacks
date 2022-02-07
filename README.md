1. Clone the repo
2. Build the Docker image from "netcat docker" folder
   - docker build -t netcat .
3. Build the tomcat-log4j2 Docker image from "tomcat-log4j2 docker" folder
   - docker build -t tomcat-log4j2 .
4. Start the netcat container (in it's own terminal window)
   - docker run -it netcat
5. Start the tomcat-log4j2 container (in it's own terminal window)
   - docker run -it -p 8088:8080 
6. You can now communicate with the tomcat container from the localhost over port 8088 (e.g. http://127.0.0.1:8088)

The netcat container should have an ip address of 172.17.0.2

The tomcat-log4j2 container should have an ip address of 172.17.0.3
