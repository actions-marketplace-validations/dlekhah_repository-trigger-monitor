FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    jq

# Copy your bash scripts or code
COPY workflow.sh /workflow.sh

# Set the entrypoint
ENTRYPOINT ["/workflow.sh"]
