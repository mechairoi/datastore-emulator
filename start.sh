#!/usr/bin/env bash

if [ -z "$DATASTORE_PROJECT_ID" ]; then
    echo "ERROR 'DATASTORE_PROJECT_ID' is not set"
    exit 1
fi

# Create a datastore
/cloud-datastore-emulator/cloud_datastore_emulator create --project_id=$DATASTORE_PROJECT_ID /datastore

# Copy any indexes, only YAML files are considered
cp /opt/datastore-index/*.yaml /datastore/WEB-INF/

# Run the datastore
/cloud-datastore-emulator/cloud_datastore_emulator start --host=0.0.0.0 --port=8282 --store_on_disk=false --consistency=1.0 /datastore
