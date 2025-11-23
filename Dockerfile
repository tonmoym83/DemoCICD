FROM tomcat:10.1-jdk21
COPY spring-boot-app.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.bat", "run"]
