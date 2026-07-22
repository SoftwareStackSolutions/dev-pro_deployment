# ============================
# Stage 1 - Build Application
# ============================
FROM maven:3.9.11-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY src src

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# ============================
# Stage 2 - Runtime
# ============================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the generated JAR
COPY --from=builder /app/target/*.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# JVM Options
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Run the application
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
