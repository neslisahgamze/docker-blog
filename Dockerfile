FROM python:3.8.0-slim

RUN apt-get -y update \
&& apt-get -y install --no-install-recommends \
	binutils \
&& rm -rf /var/lib/apt/lists/*
WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel \
&& pip install --no-cache-dir -r /app/requirements.txt

COPY . /app
