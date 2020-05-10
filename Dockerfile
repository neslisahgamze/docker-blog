FROM python:3.8.0-slim

RUN apt-get -y update \
&& apt-get -y install --no-install-recommends \
	binutils
WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel \
&& pip install -r /app/requirements.txt

COPY . /app
