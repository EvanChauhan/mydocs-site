## how can we store information past the point where the container exits?

## Persisting information after the container exits

``` -v ${PWD}:/app: Mounts the current directory (${PWD}) on your host machine to the /app directory in the container. This allows the container to access the files in your current directory.
```