FROM python:3.10-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq5 libffi7 libssl1.1 curl && \
    pip install --no-cache-dir pgadmin4 && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin
ENV PGADMIN_LISTEN_PORT=80
ENV PGADMIN_SETUP_EMAIL=${PGADMIN_DEFAULT_EMAIL}
ENV PGADMIN_SETUP_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}

# Create config folder
RUN mkdir -p /var/lib/pgadmin /var/log/pgadmin && \
    chmod -R 777 /var/lib/pgadmin /var/log/pgadmin

EXPOSE 80

CMD ["pgadmin4"]
