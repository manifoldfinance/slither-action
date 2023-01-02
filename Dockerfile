FROM python:3.11.1-slim-bullseye

RUN set -eux; \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -qqy --assume-yes --no-install-recommends \
    git \
    ca-certificates; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*;

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

RUN pip install --no-cache-dir --upgrade pip
RUN pip install solc-select

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
