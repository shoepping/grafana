# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG GRAFANA_VERSION=7.3.4-ubuntu
# Using official grafana image
FROM grafana/grafana:${GRAFANA_VERSION}
ARG GRAFANA_VERSION

LABEL GRAFANA_VERSION=${GRAFANA_VERSION}

# Set work directory to /grafana
WORKDIR /grafana

# Copy configuration file, provisioning and dashboard folders to container
COPY ./grafana.ini /etc/grafana/grafana.ini
COPY ./provisioning /etc/grafana/provisioning
COPY ./dashboards /var/lib/grafana/dashboards
