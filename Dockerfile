# Use the official Haskell image to create a build artifact.
# https://hub.docker.com/_/haskell/
FROM haskell:8 as builder

# Copy local code to the container image.
WORKDIR /app
COPY . .

# Build and test our code, then build the “peterlogg-dotcom-backend-haskell-exe” executable.
RUN stack setup
RUN stack test
RUN stack build --copy-bins

# Use a Docker multi-stage build to create a lean production image.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine:latest

# Add the libraries we need to run the application
RUN apk add libc6-compat gmp
COPY --from=builder /root/.local/bin/peterlogg-dotcom-backend-exe .

# Run the web service on container startup.
CMD ["./peterlogg-dotcom-backend-exe"]
