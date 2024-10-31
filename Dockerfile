# FROM python:3.10-slim

# WORKDIR /app
# COPY ./gallery-dl .
# RUN python3 -m pip install -U .

# RUN apt-get update && apt-get install -y --no-install-recommends \
#   curl \
#   && apt-get clean \
#   && rm -rf /var/lib/apt/lists/*

# CMD [ "/bin/bash", "gallery-dl" ]

# Use Alpine-based Python
FROM python:3.13-alpine AS base

# Install GNU versions of required tools and other dependencies
RUN apk add --no-cache \
  curl \
  bash \
  coreutils \
  findutils \
  grep \
  sed \
  util-linux

# Set the working directory
WORKDIR /app

# Copy and install gallery-dl
COPY ./gallery-dl .
RUN pip install -U .

# Clean up to save space
RUN find /usr/local/lib/python3.13 -name '__pycache__' -type d -exec rm -rf {} +

# Set the default command
CMD ["gallery-dl"]
