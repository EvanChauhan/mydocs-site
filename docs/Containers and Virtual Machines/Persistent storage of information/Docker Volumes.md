## how can we store information past the point where the container exits?
when the container has executed and goes away the file system within it also goes away/

We need a way of persisting the information stored within a container that can outlive the container i.e a means of container storage

Docker volumes the solution available 

Volumes allow you to save data - alleviating any concerns you may have about containers rebooting or otherwise becoming unavailable during your app's lifecycle 

file systems are presented to containers as unified sets of folders behind the scenes

when a volume is mounted into a container, Docker transparently maps a folder into a mount point within the container. How this folder is created and presented to the container is managed by a _volume driver_

__volume drivers__ define how volumes are created and managed by containers.

### creating Docker Volumes

create a new volume with *docker volume create*

change volume drivers with *-d*

mount volumes onto containers with 

` docker run --volume or docker run --mount `

### docker run --mount
"type=TYPE,source=DIR,destination=dir,readonly,volume-opt"

* type -> specifies the type of volume we are creating i.e bind, tnpfs, this will always be volume
* source -> specifies the name of the volume that is being mounted into the container i.e the name of the argument provided to the Docker volume create command from earlier
* destination -> specifies where to mount the volume to within the container it can be any directory and if it doesn't exist within the container image Docker will create and bind you volume to it
* specify ro to mark the volume as readonly
    > a use case for this is when you want to mount data that the container shouldn't be able to modify like passwords or configuration files
* finally you can provide specific options to the volume driver with the volume-opt key 
    the value that you provide can vary from driver to driver and this can be specified more than once?
* type, source and destination are mandatory where as read-only and volume-opt are not

### docker run -v "source:destination:[ro]"
* (ro or readonly is optional)
* we must specify three argument separated by colons
    * the name of the volume, or the source here it is not given so it is randomly assigned 4290a5217651ed6e1..
    

> ` docker run --rm -p 8000:8000 -v ${PWD}:/app --name my-docs -d evan.chauhan/my-mkdocs-site:1.0 `


## Persisting information after the container exits

``` -v ${PWD}:/app: Mounts the current directory (${PWD}) on your host machine to the /app directory in the container. This allows the container to access the files in your current directory where it can store data on your local file system - therefore persisting the data beyond the point where the container terminates
```