FROM 3.9.6-eclipse-temurin-11-alphine as builder

WORDIR /app

COPY pom.xml  .

RUN -e -B dependency:resolve

COPY src ./src

RUN mvn -e -B package 


FROM openjdk:8-jre-alphine

COPY --from=builder /app/target/app.jar/

CMD ["java","-jar","/app.jar"]
