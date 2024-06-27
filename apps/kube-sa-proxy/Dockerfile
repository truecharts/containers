# Stage 1 - Build the Go application
FROM golang:1.22.4-alpine@sha256:ace6cc3fe58d0c7b12303c57afe6d6724851152df55e08057b43990b927ad5e8 AS builder

# Install necessary build dependencies
RUN apk --no-cache add --update gcc musl-dev

# Create the necessary directories
RUN mkdir -p /build /output

# Set the working directory
WORKDIR /build

# Copy go mod and sum files
COPY apps/kube-sa-proxy/go.mod apps/kube-sa-proxy/go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the Go application source code
COPY apps/kube-sa-proxy/cmd/main.go .
COPY apps/kube-sa-proxy/internal/config ./internal/config
COPY apps/kube-sa-proxy/internal/proxy ./internal/proxy
COPY apps/kube-sa-proxy/internal/utils ./internal/utils

# Build the Go application
RUN go build -ldflags "-w -s" -o /output/my-proxy-service .

# Stage 2 - Create the final image
FROM alpine@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0 AS runner

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
