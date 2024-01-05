FROM maven:3.8.4-openjdk-11 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn -e -B dependency:resolve

COPY src ./src
RUN mvn -e -B package

FROM openjdk:8-jre-alpine

COPY --from=builder /app/target/app.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

