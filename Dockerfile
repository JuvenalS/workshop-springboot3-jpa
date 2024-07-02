FROM maven:3-eclipse-temurin-17 AS build

COPY . .

RUN mvnclean package -DskipTests

FROM eclipse-temurin:17-alpine

EXPOSE 8080

COPY --from=build /target/course-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
