# Use a Windows Server Core image with Tomcat installed
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Copy WAR into Tomcat webapps
COPY myapp.war C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\webapps\\

# Expose Tomcat port
EXPOSE 8080

# Run Tomcat using Windows command
CMD ["C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\bin", "run"]
