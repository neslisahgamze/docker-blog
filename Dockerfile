FROM python:3.8.0-slim

RUN apt-get -y update
RUN apt-get -y install binutils
WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /app/requirements.txt

COPY . /app
