# Project: server-datastore-emulator

FROM docker-repo.int.egym.de:443/lib-jre

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y unzip && \
    apt-get -y autoremove && apt-get clean

# Download the latest gcd zip file from https://storage.googleapis.com/gcd/
COPY cloud-datastore-emulator.sha256 /
ADD https://storage.googleapis.com/gcd/tools/cloud-datastore-emulator-1.2.1.zip /
RUN sha256sum -c cloud-datastore-emulator.sha256 && \
    unzip cloud-datastore-emulator-1.2.1.zip && \
    rm cloud-datastore-emulator-1.2.1.zip

ENV DATASTORE_EMULATOR_HOST localhost:8282

ADD start.sh /start.sh

# Optional volume which contains all complex index definitions as YAML files
VOLUME ["/opt/datastore-index/"]

EXPOSE 8282
ENTRYPOINT ["/start.sh"]
