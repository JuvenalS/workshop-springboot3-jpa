FROM maven:3.8.2-jdk-17 AS build

COPY . .

RUN mvn clean package -Pprod -DskipTests

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /target/course-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
