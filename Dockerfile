# # FROM python:3.8-slim-buster
# # FROM alpine:latest
# FROM ubuntu:22.04
# RUN apt-get update
# RUN apt-get install -y python3

# # RUN apk add --no-cache python3-dev \
# #     && pip install --upgrade pip

# # WORKDIR /app
# # COPY . ./app

# COPY requirements.txt /app/requirements.txt
# WORKDIR /app
# RUN pip --no-cache-dir install -r requirements.txt
# # RUN pip install -r requirements.txt
# COPY . ./app

# EXPOSE 5000

# ENTRYPOINT [ "python3" ]
# CMD ["app.py"]


# New One

FROM ubuntu

RUN apt update
RUN apt install python3-pip -y

COPY requirements.txt /app/requirements.txt
WORKDIR /app

RUN pip --no-cache-dir install -r requirements.txt
RUN python3 -m nltk.downloader punkt
RUN python3 -m nltk.downloader stopwords



COPY . .

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD ["app.py"]
