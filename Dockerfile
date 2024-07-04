## alpine bedeutet wollen kleines image bekommen

FROM alpine/java:21-jdk

## erstellen einen nutzer und fügen ihm einer Gruppe zu -> damit nicht jeder nutzer root rechte hat
RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

ARG JAR_FILE=build/libs/*.jar

## diese app wird dann ausgeführt
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]