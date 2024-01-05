FROM maven:3.9.6-eclipse-temurin-11-alpine AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn -e -B dependency:resolve

COPY src ./src
RUN mvn -e -B package

FROM openjdk:8-jre-alphine

COPY --from=builder /app/target/app.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

