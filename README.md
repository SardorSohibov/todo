# 📝 TODO Application (Jakarta EE + JSP + Servlets)

A simple **TODO web application** built with **Jakarta EE** using **JSP** and **Servlets**, running on **Apache Tomcat**.  
This project demonstrates the fundamentals of Java web development without heavy frameworks.

---

## ✨ Features

- Add, edit, and delete TODO tasks
- View all tasks in a clean JSP page
- Servlet-based request handling
- Runs on **Apache Tomcat**

---

## 🛠 Technologies Used

- **Java (Jakarta EE)**
- **JSP (JavaServer Pages)**
- **Servlets**
- **Apache Tomcat**
- **Maven** (for build & dependency management)
- **Docker** *(optional, for containerized deployment)*

---

## 📦 Prerequisites

Before you begin, make sure you have installed:

- [Java JDK 11+](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)  
- [Apache Tomcat 9/10](https://tomcat.apache.org/download-10.cgi)  
- [Maven](https://maven.apache.org/)  

(Optional: [Docker](https://www.docker.com/) for containerized setup)

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/SardorSohibov/todo.git
cd todo
### 2. Build the project
mvn clean package
### 3.  Deploy to Tomcat

Copy the generated .war file into your Tomcat webapps/ directory

cp target/todo.war $TOMCAT_HOME/webapps/

Start Tomcat:
$TOMCAT_HOME/bin/startup.sh

Open your browser at:
http://localhost:8080/todo
