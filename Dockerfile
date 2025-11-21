FROM python:3.10-slim-bookworm

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libpq5 \
        libffi8 \
        libssl3 \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install pgAdmin
RUN pip install --no-cache-dir pgadmin4

# Create required directories
RUN mkdir -p /var/lib/pgadmin /var/log/pgadmin && \
    chmod -R 777 /var/lib/pgadmin /var/log/pgadmin

# Add config to disable interactive setup and import os
RUN echo "\
import os\n\
SERVER_MODE = True\n\
DEFAULT_SERVER = '0.0.0.0'\n\
DEFAULT_SERVER_PORT = 80\n\
PGADMIN_SETUP_EMAIL = os.getenv('PGADMIN_DEFAULT_EMAIL')\n\
PGADMIN_SETUP_PASSWORD = os.getenv('PGADMIN_DEFAULT_PASSWORD')\n\
MASTER_PASSWORD_REQUIRED = False\n\
" > /usr/local/lib/python3.10/site-packages/pgadmin4/config_local.py

# Environment variables
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin

EXPOSE 80

CMD ["pgadmin4"]
