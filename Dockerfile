FROM python:3.10-slim

WORKDIR /app
COPY /home/runner/work/gallery-dl-docker/gallery-dl-docker/gallery-dl .
RUN python3 -m pip install -U .

ENTRYPOINT [ "gallery-dl" ]
