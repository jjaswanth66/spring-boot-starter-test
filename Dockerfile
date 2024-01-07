FROM maven:latest-openjdk-11-slim

MAINTAINER jjaswanth66@gmail.com

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn --version

RUN mvn package 


