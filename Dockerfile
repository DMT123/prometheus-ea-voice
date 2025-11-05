FROM prom/prometheus:latest

# Copy custom configuration
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Create data directory
RUN mkdir -p /prometheus

# Expose Prometheus port
EXPOSE 9090

# Set working directory
WORKDIR /prometheus

# Run Prometheus with custom config
CMD ["--config.file=/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/share/prometheus/consoles", \
     "--web.enable-lifecycle"]
