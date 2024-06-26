# Stage 1 - Build the Go application
FROM golang:1.19.3-alpine AS builder

# Install necessary build dependencies
RUN apk --no-cache add --update gcc musl-dev

# Create the necessary directories
RUN mkdir -p /build /output

# Set the working directory
WORKDIR /build

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the Go application source code
COPY cmd/main.go .
COPY internal/config ./internal/config
COPY internal/proxy ./internal/proxy
COPY internal/utils ./internal/utils

# Build the Go application
RUN go build -ldflags "-w -s" -o /output/my-proxy-service .

# Stage 2 - Create the final image
FROM alpine AS runner

# Set maintainer label
LABEL maintainer="Xstar97 <dev.xstar97@gmail.com>"

# Install necessary runtime dependencies
RUN apk --no-cache add ca-certificates

# Set the working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /output/my-proxy-service .

# Set environment variables
ENV PORT=3000

# Expose the port
EXPOSE $PORT

# Set the default command to run the binary
CMD sh -c "./my-proxy-service"
