FROM 3.9.6-eclipse-temurin-11-alphine AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn -e -B dependency:resolve

COPY src ./src
RUN mvn package

FROM openjdk:latest

COPY --from=builder /app/target/app.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

