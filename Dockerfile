FROM maven:3.8.5-openjdk-11 AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
FROM openjdk
EXPOSE 5000
COPY --from=maven_build /tmp/target/eb-java-ci-cd-0.0.1-SNAPSHOT.jar /data/eb-java-ci-cd-0.0.1-SNAPSHOT.jar
CMD java -jar -Dspring.profiles.active=prod  /data/eb-java-ci-cd-0.0.1-SNAPSHOT.jar