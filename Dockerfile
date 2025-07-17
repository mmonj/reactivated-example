ARG UV_VERSION=0.7.10
ARG NODE_VERSION=18.18.2
# ARG NODE_VERSION=19.9.0
# ARG NODE_VERSION=20.19.4
# ARG NODE_VERSION=22.17.1
# ARG NODE_VERSION=23.11.1
# ARG NODE_VERSION=24.4.1

FROM ghcr.io/astral-sh/uv:${UV_VERSION} AS uv_src

FROM python:3.12.1-slim

COPY --from=uv_src /uv /uvx /bin/

WORKDIR /app

ARG UV_VERSION
ARG NODE_VERSION

ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH="$NODE_HOME/lib/node_modules"
ENV PATH="$NODE_HOME/bin:$PATH"
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

RUN apt update -y && apt upgrade -y \
    && apt install -y --no-install-recommends git curl ca-certificates \
    # install Node
    && curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

COPY package.json package-lock.json ./
COPY pyproject.toml uv.lock ./

# from .env
ARG UID

RUN adduser -u ${UID} --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# install dependencies
RUN uv sync && npm ci
