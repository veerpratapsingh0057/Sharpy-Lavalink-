# Use Eclipse Temurin for a lightweight Java 17 runtime
FROM eclipse-temurin:17-jre-focal

# Set the working directory
WORKDIR /opt/Lavalink

# Copy the Lavalink.jar and the plugins directory
COPY Lavalink.jar Lavalink.jar
COPY plugins/ plugins/
COPY application.yml application.yml

# Expose the default Lavalink port
EXPOSE 443

# Run Lavalink
ENTRYPOINT ["java", "-Xmx2G", "-jar", "Lavalink.jar"]
