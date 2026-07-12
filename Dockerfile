# Use official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /lavalink

# Copy the Lavalink JAR and configuration
COPY Lavalink.jar .
COPY application.yml .

# Expose default Lavalink port
EXPOSE 443

# Healthcheck (optional) – checks if the server is responding
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:2333/version || exit 1

# Run Lavalink
ENTRYPOINT ["java", "-jar", "Lavalink.jar"]