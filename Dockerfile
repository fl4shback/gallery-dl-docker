FROM python:3.10-slim

WORKDIR /app
RUN python3 -m pip install --no-index --find-links=/home/runner/work/gallery-dl-docker/gallery-dl-docker/gallery-dl gallery-dl

ENTRYPOINT [ "gallery-dl" ]
