FROM python:3.8.0-slim AS builder

RUN apt-get -y update \
&& apt-get -y install --no-install-recommends \
	binutils \
&& rm -rf /var/lib/apt/lists/*
WORKDIR app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel \
&& pip install --no-cache-dir  --user -r /app/requirements.txt

FROM python:3.8.0-slim AS app
COPY --from=builder /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

COPY . /app