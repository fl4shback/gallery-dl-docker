FROM python:3.10-slim

WORKDIR /app
COPY ./gallery-dl .
RUN python3 -m pip install -U .

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash", "gallery-dl" ]
