#!/usr/bin/env bash

# Create a datastore
/cloud-datastore-emulator/cloud_datastore_emulator create /datastore

# Copy any index files
INDEX_YAML_FILE=/opt/datastore-index/index.yaml
INDEX_XML_FILE=/opt/datastore-index/datastore-indexes.xml
INDEX_FOLDER=/datastore/WEB-INF/

if [ -f $INDEX_YAML_FILE ]; then
    echo "Copy '$INDEX_YAML_FILE' to '$INDEX_FOLDER'."
    cp $INDEX_YAML_FILE $INDEX_FOLDER
fi

if [ -f $INDEX_XML_FILE ]; then
    echo "Copy '$INDEX_XML_FILE' to '$INDEX_FOLDER'."
    cp $INDEX_XML_FILE $INDEX_FOLDER
fi

# Run the datastore
/cloud-datastore-emulator/cloud_datastore_emulator start --host=0.0.0.0 --port=8282 --store_on_disk=false --consistency=1.0 /datastore
