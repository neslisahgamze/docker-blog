FROM python:3.8.0-slim

COPY . /app

RUN apt-get -y update
RUN apt-get -y install binutils
WORKDIR app
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /app/requirements.txt
