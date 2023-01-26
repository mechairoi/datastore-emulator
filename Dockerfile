FROM eclipse-temurin:19-jre

RUN apt-get update && apt-get install -y \
    zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Download the latest gcd zip file from https://storage.googleapis.com/gcd/
COPY cloud-datastore-emulator.sha256 /
ADD https://storage.googleapis.com/gcd/tools/cloud-datastore-emulator-2.3.0.zip /
RUN sha256sum -c cloud-datastore-emulator.sha256 && \
    unzip cloud-datastore-emulator-2.3.0.zip && \
    rm cloud-datastore-emulator-2.3.0.zip

ENV DATASTORE_EMULATOR_HOST localhost:8282

ADD start.sh /start.sh

# Optional volume which contains all complex index definitions as YAML files
VOLUME ["/opt/datastore-index/"]

EXPOSE 8282
ENTRYPOINT ["/start.sh"]
