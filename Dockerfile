FROM dpage/pgadmin4:latest

# Imposta variabili di default (le puoi sovrascrivere su Render)
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin
EXPOSE 80
