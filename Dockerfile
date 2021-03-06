#FROM ubuntu:18.04
FROM python:slim
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY app/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY app/. /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
