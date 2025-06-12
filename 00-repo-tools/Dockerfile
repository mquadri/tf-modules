# Multi-stage build for Terraform quality check tools
FROM hashicorp/terraform:latest AS base

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    tar \
    grep \
    sudo

# Add tflint
FROM base AS with-tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# Add terraform-docs
FROM with-tflint AS with-terraform-docs
RUN curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && \
    tar -xzf terraform-docs.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/local/bin/ && \
    rm -f terraform-docs.tar.gz

# Final image
FROM with-terraform-docs

# Create a non-root user for better security
RUN addgroup -S terraform && adduser -S terraform -G terraform
RUN mkdir -p /workspace && chown -R terraform:terraform /workspace

# Create directories with proper permissions
RUN mkdir -p /output && chmod 777 /output
RUN mkdir -p /tmp/terraform-docs-output && chmod 777 /tmp/terraform-docs-output

# Set working directory
WORKDIR /workspace

# Create an entrypoint script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'terraform --version' >> /entrypoint.sh && \
    echo 'tflint --version' >> /entrypoint.sh && \
    echo 'terraform-docs --version' >> /entrypoint.sh && \
    echo 'echo "All tools installed and ready to use"' >> /entrypoint.sh && \
    echo 'exec "$@"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh"]
