# This Dockerfile can be run from IntelliJ for dev purposes, though not sure about debugging

FROM openjdk:13.0.2-slim

COPY ./build/classes/java/main /tmp
WORKDIR /tmp
ENTRYPOINT ["java", "com.ctc.devexp.HelloDevExp"]
