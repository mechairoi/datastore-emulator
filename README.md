Google Cloud Datastore Emulator
===============================

The project is used for local datastore testing by using the Google Cloud [Datastore Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator) in a docker container without the need of the `gcloud` CLI.


To run the image execute:
```
docker run -d -p 8282:8282 --name datastore egymgmbh/datastore-emulator:latest
```

If you have any complex index data then you can mount your indexes as a volume to the container, e.g.:
```
docker run -d -p 8282:8282 -v <local-path-to-index-files>:/opt/datastore-index --name datastore egymgmbh/datastore-emulator:latest
```

Note that only `index.yaml` and `datastore-indexes.xml` index files are considered, for more information please refer to the [index documentation](https://cloud.google.com/datastore/docs/tools/indexconfig).

If you don't provide any index files then the datastore emulator indexes will be generated automatically.

In order to use the datatore on the host machine you need to add the following two environmental variables:
```
DATASTORE_EMULATOR_HOST=localhost:8282
DATASTORE_PROJECT_ID=<cloud-project-id>
```

For more information please refer to the [datastore emulator documentation](https://cloud.google.com/datastore/docs/tools/datastore-emulator).
