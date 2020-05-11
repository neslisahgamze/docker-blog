# syntax = docker/dockerfile:1.0-experimental
FROM python:3.8.0-slim AS builder

RUN apt-get -y update \
&& apt-get -y install --no-install-recommends \
	binutils \
&& rm -rf /var/lib/app/lists/*

WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install --upgrade pip setuptools wheel \
&& pip install --user -r /app/requirements.txt

FROM python:3.8.0-slim AS app
COPY --from=builder /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

COPY . /app