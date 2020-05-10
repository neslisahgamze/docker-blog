# syntax = docker/dockerfile:1.0-experimental
FROM python:3.8.0-alpine AS builder

RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .builds-deps build-base linux-headers

WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install --upgrade pip setuptools wheel \
&& pip install --user -r /app/requirements.txt

FROM python:3.8.0-alpine AS app
COPY --from=builder /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

COPY . /app