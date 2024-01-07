FROM maven:3.8.4-openjdk-11-slim

MAINTAINER jjaswanth66@gmail.com

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn --version
RUN mvn clean

RUN mvn package 


