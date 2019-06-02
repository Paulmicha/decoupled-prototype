
# DB dumps bind mount

This folder is meant to be used as a [docker bind mount](https://docs.docker.com/storage/bind-mounts/) for DB dumps.

This allows to persist the data locally, even if the container is destroyed.

Note that these files are accessible to other processes on the host.
