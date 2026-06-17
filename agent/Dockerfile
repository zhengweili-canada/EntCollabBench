FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

ARG AGENT_NAME=it_service_desk_l1
ARG DEBIAN_MIRROR=mirrors.tuna.tsinghua.edu.cn
ARG DEBIAN_SECURITY_MIRROR=mirrors.tuna.tsinghua.edu.cn

WORKDIR /app

RUN set -eux; \
    if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
      sed -i "s|http://deb.debian.org/debian|https://${DEBIAN_MIRROR}/debian|g" /etc/apt/sources.list.d/debian.sources; \
      sed -i "s|http://security.debian.org/debian-security|https://${DEBIAN_SECURITY_MIRROR}/debian-security|g" /etc/apt/sources.list.d/debian.sources; \
      sed -i "s|http://deb.debian.org/debian-security|https://${DEBIAN_SECURITY_MIRROR}/debian-security|g" /etc/apt/sources.list.d/debian.sources; \
    fi; \
    if [ -f /etc/apt/sources.list ]; then \
      sed -i "s|http://deb.debian.org/debian|https://${DEBIAN_MIRROR}/debian|g" /etc/apt/sources.list; \
      sed -i "s|http://security.debian.org/debian-security|https://${DEBIAN_SECURITY_MIRROR}/debian-security|g" /etc/apt/sources.list; \
      sed -i "s|http://deb.debian.org/debian-security|https://${DEBIAN_SECURITY_MIRROR}/debian-security|g" /etc/apt/sources.list; \
    fi; \
    export DEBIAN_FRONTEND=noninteractive; \
    for attempt in 1 2 3 4 5; do \
      if apt-get update -o Acquire::Retries=10 \
        && apt-get install -y --no-install-recommends --fix-missing \
          tesseract-ocr \
          tesseract-ocr-eng \
          tesseract-ocr-chi-sim \
          poppler-utils \
          libmagic1; then \
        break; \
      fi; \
      echo "apt install failed on attempt ${attempt}, trying recovery..."; \
      dpkg --configure -a || true; \
      apt-get -f install -y || true; \
      rm -rf /var/lib/apt/lists/*; \
      sleep $((attempt * 3)); \
    done; \
    dpkg --configure -a; \
    apt-get -f install -y; \
    dpkg -s tesseract-ocr tesseract-ocr-eng tesseract-ocr-chi-sim poppler-utils >/dev/null 2>&1; \
    (dpkg -s libmagic1 >/dev/null 2>&1 || dpkg -s libmagic1t64 >/dev/null 2>&1); \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY agent/requirements.txt /app/requirements.txt

RUN python -m pip install --no-cache-dir --upgrade \
    "pip<26" "setuptools<81" wheel

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY agent.py /app/agent.py
COPY my_verification /app/my_verification
COPY api_schema.py /app/api_schema.py
COPY session_store.py /app/session_store.py
COPY tool /app/tool
COPY local_data/${AGENT_NAME} /app/local_data/${AGENT_NAME}

EXPOSE 8001 8002 8003 8004 8005 8006 8007 8008 8009 8010 8011

CMD ["python", "agent.py"]
