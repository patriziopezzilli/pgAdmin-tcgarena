FROM python:3.10-slim-bookworm

# Install OS dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libpq5 \
        libffi8 \
        libssl3 \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install pgAdmin from pip
RUN pip install --no-cache-dir pgadmin4

# Environment
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin
ENV PGADMIN_LISTEN_PORT=80

# Create required folders
RUN mkdir -p /var/lib/pgadmin /var/log/pgadmin && \
    chmod -R 777 /var/lib/pgadmin /var/log/pgadmin

EXPOSE 80

# Start pgAdmin
CMD ["pgadmin4"]
