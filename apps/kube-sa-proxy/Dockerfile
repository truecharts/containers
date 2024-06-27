# Stage 1 - Build the Go application
FROM golang:1.19.13-alpine@sha256:0ec0646e208ea58e5d29e558e39f2e59fccf39b7bda306cb53bbaff91919eca5 AS builder

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
