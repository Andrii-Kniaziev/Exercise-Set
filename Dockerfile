# Use an OpenJDK base image
FROM azul/zulu-openjdk:17-latest

# Install Gradle 8.8
ENV GRADLE_VERSION=8.8
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip && \
    mv gradle-${GRADLE_VERSION} /opt/gradle && \
    ln -s /opt/gradle/bin/gradle /usr/bin/gradle

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradle /app/gradle
COPY gradlew /app
COPY build.gradle /app
COPY settings.gradle /app

# Copy the source code
COPY src /app/src

# Build the application
RUN chmod +x gradlew && ./gradlew clean build

# Copy the built JAR to the final location
COPY build/libs/*.jar /app/app.jar

# Expose the port (change if needed)
EXPOSE 8080

# Set the entrypoint
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
