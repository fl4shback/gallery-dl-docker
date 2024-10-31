FROM python:3.13-alpine AS base

RUN apk add --no-cache \
  curl \
  bash \
  coreutils \
  findutils \
  grep \
  sed \
  util-linux

WORKDIR /app

COPY ./gallery-dl .
RUN pip install -U .

# Clean up to save space
RUN find /usr/local/lib/python3.13 -name '__pycache__' -type d -exec rm -rf {} +

CMD ["gallery-dl"]
