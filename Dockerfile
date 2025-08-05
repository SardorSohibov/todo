# 1. Java va Maven bilan build qilamiz
FROM maven:3.8.5-openjdk-17-slim AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# 2. Tomcat image'iga .war faylni joylaymiz
FROM tomcat:9.0-jdk17
COPY --from=builder /app/target/todo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
