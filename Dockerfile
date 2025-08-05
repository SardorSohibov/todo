# Tomcat bazasidan boshlaymiz
FROM tomcat:9.0

# Default webapps ni o‘chiramiz
RUN rm -rf /usr/local/tomcat/webapps/*

# O‘zingizning .war faylingizni ROOT.war sifatida qo‘shamiz
COPY target/todo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat 8080 port orqali ishlaydi
EXPOSE 8080

# Tomcatni ishga tushirish komandasi
CMD ["catalina.sh", "run"]
