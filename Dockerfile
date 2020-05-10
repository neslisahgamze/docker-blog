FROM python:3.8.0-alpine

RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .builds-deps build-base linux-headers

WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel \
&& pip install --no-cache-dir  --user -r /app/requirements.txt

COPY . /app