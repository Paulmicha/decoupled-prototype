
# DB bind mount

This folder is meant to be used as a [docker bind mount](https://docs.docker.com/storage/bind-mounts/) for databases (1 subfolder per database, using `data/db/default` for default DB).

This allows to persist the data locally, even if the container is destroyed.

Note that these files are accessible to other processes on the host.
