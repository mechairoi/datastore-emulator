FROM openjdk:8-jre-alpine

RUN apk update && \
    apk upgrade && \
    apk add bash unzip

# Download the latest gcd zip file from https://storage.googleapis.com/gcd/
COPY cloud-datastore-emulator.sha256 /
ADD https://storage.googleapis.com/gcd/tools/cloud-datastore-emulator-2.0.2.zip /
RUN sha256sum -c cloud-datastore-emulator.sha256 && \
    unzip cloud-datastore-emulator-2.0.2.zip && \
    rm cloud-datastore-emulator-2.0.2.zip

ENV DATASTORE_EMULATOR_HOST localhost:8282

ADD start.sh /start.sh

# Optional volume which contains all complex index definitions as YAML files
VOLUME ["/opt/datastore-index/"]

EXPOSE 8282
ENTRYPOINT ["/start.sh"]
