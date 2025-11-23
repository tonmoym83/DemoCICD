FROM tomcat:10.1-jdk21
COPY demoCICD-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.bat", "run"]
