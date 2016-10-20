Google Cloud Datastore Emulator
===============================

The project is used for local datastore testing by using the Google Cloud [Datastore Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator) in a docker container.

To build the the docker image run:
```
docker build -t  server-datastore-emulator:latest .
```

To run the image you need to specify your [Cloud Project ID](https://cloud.google.com/datastore/docs/activate) as an evironmental variable, in the case of `server-workout` this would be `DATASTORE_PROJECT_ID=test-xx-workout`, then run:
```
docker run -d -p 8282:8282 -e DATASTORE_PROJECT_ID=test-xx-workout --name datastore server-datastore-emulator:latest
```

If you have any complex index data then you can mount your indexes as a volume to the container, e.g.:
```
docker run -d -p 8282:8282 -e DATASTORE_PROJECT_ID=test-xx-workout -v <local-path-to-index-yaml-files>:/opt/datastore-index --name datastore server-datastore-emulator:latest
```

Note that only `*.yaml` index files are considered, for more information please refer to the [index documentation](https://cloud.google.com/datastore/docs/tools/indexconfig).

In order to use the datatore on the host machine you need to add the following two environmental variables:
```
DATASTORE_EMULATOR_HOST=localhost:8282
DATASTORE_PROJECT_ID=test-xx-workout # or whatever your project ID is.
```

For more information please refer to the [datastore emulator documentation](https://cloud.google.com/datastore/docs/tools/datastore-emulator).
