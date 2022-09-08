FROM python:3.10-slim

WORKDIR /app
RUN python3 -m pip install -U ./gallery-dl

ENTRYPOINT [ "gallery-dl" ]
