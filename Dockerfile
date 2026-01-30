from eclipse-temurin : 17-jre
WORKDIR /app
COPY target/sample-app-1.0-snapshot.jar app.jar
expose 8080
CMD ['java', '-jar', 'app.jar']
