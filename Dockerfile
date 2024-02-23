FROM python:3.10-slim

WORKDIR /app
COPY ./gallery-dl .
RUN python3 -m pip install -U .

CMD [ "/bin/bash", "gallery-dl" ]
