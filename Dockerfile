FROM alpine:3 as extractor
RUN apk update && \
    apk upgrade && \
    apk add unzip

COPY cloud-datastore-emulator.sha256 /

# Download the latest gcd zip file from https://storage.googleapis.com/gcd/
ADD https://storage.googleapis.com/gcd/tools/cloud-datastore-emulator-2.3.0.zip /
RUN sha256sum -c cloud-datastore-emulator.sha256 && \
    unzip cloud-datastore-emulator-2.3.0.zip && \
    rm cloud-datastore-emulator-2.3.0.zip

FROM eclipse-temurin:19-jre

COPY --from=extractor /cloud-datastore-emulator /cloud-datastore-emulator

ENV DATASTORE_EMULATOR_HOST localhost:8282

ADD start.sh /start.sh

# Optional volume which contains all complex index definitions as YAML files
VOLUME ["/opt/datastore-index/"]

EXPOSE 8282
ENTRYPOINT ["/start.sh"]
