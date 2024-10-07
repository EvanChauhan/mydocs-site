# Containerisation 

What is _containerisation?_ And what problem does it aim to solve?

__Container__ technology, as the name suggests, exists to solve the commonly encountered problems that arise from software applications having unmet dependencies when moved to new environments i.e the commonly encountered case of "but it works on my machine"

this problem would occur if say a paritcular software library like for example matplot.lib saw an update but that particular software developer's application was using an older/un-updated version of matplotlib and the updated version changed for example some functions' names. 

In this case, when the application would go to run in a new environment with updated libraries, it would not work correctly as it will be invoking the function by the old name.

Containerisation aims to solve this problem by packaging an application with all of its dependencies so that it is in effect machine-agnostic - that is to say - the application and all of its dependencies are transported within a 'container' in between environments 

in this example that would mean the developer's application along with the version of matplotlib that it uses are packaged within a _container_ so that the application can run in any environment i.e it is a containerised application

Container
 : here is the commonly touted definition of a container 
 a container is like a mini-computers that run applications. They need a specific environment to work correctly, just like a plant needs soil, water, and sunlight but they're distinct to virtual machines

 Container runtime
 :  a container runtime therefore is a tool that creates, manages, and deletes these containers. To further elaborate on the garden metaphor - think of them as gardeners who prepare the soil, plant the seeds, and take care of the plants.

 they're important as they simplify this process greatly i.e without them you would have to manually like setting up the environment for each plant (application) - a tiresome labor

1. ### Creation 
performed by the _docker create_ command 

> docker create nginx 

creates a new container from the nginx image without starting it

2. ### start 
performed by the _docker start_ command 
transitions the container from the 'created' state to the 'running' state
in this state the primary process specified within the container image begins executing
i.e web server, database process whatever it is

> docker start <container_id>

3. ### run

> docker run
alternatively - like with git checkout -b - _docker run -d -p 8080:80 nginx 
combines the creation and start phases of the container 
this instruction starts a container running nginx in detached mode > -d -p and maps port > 80 in the container to port > 8080 on the host

4. ### pausing and restarting the container
> docker pause and docker unpause

> docker pause <container_id>
docker unpause <container_id> which will resume the execution of the process running within the container - effectively returning it to the **"running"** state

5. ### stop
> docker stop 

this will terminate a running container by sending a 
> sig term signal to 'gracefully' shut down the container's main process.
note: if the process has still not exited then after a timeout period Docker will send a _SIGKILL_ signal to forcefully terminate the container.
    effectively transitioning it to a 'stopped state'

> docker stop <container_id>

6. ### kill 
> docker kill 
> this will forcefully stop a running container by immediately imposing a _SIGKILL_ signal, rather than allowing the container to gracefully stop
> the container is immediately stopped and enters the **Stopped** state 

> docker kill <container_id>

7. ### restart
> docker restart <container id>
> The docker restart command stops and then starts a container. This is equivalent to issuing a docker stop followed by a docker start.
> it has the identical effect as 

8. ### removing 
> docker rm <container id>
alternatively a container can be removed immediately after it is stopped 
> once a container is stopped it can be deleted via *docker rm* 
permanently deleting the container's metadata, network settings and filesystem
> although the image used to create the container persists i.e remains intact 
> transitioning the container to a removed state where it no longer exists on the system
> another technique is to stop a container after it finishes using -rm i.e 
> docker run --rm nginx here the container is automatically removed after it terminates 
> running a container with the *--rm* flag instructs docker to remove the container once it has stopped
> docker run --rm busybox echo "Hello World"
After the container executes the echo command and stops, it is immediately removed.

9. ### container logs and inspection

> docker logs <container_id>
> docker inspect <container_id>


