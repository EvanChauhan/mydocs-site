# Docker Technology

![Docker meme](https://programmerhumor.io/wp-content/uploads/2022/12/programmerhumor-io-cloud-memes-programming-memes-bc6e34b0583f194.jpg)


Docker is a Containerisation tool

Docker summarised 

- - - 
When we say an application has been *Dockerized* it has been containerized 


the primary challenge that Docker technology seeks to answer is allowing code/applications to run successfully or as _intended_ across multiple machines i.e in different _environments_

the reason this presents as a challenge is because applications will depend on various things such as 

* versions of software libraries 
* operating system it will be run by 
* hardware dependencies 

this can be problematic as not all of these factors may remain consistent with application deployment 

# Mechanics of Docker

---

> docker takes an innovative approach by establishing a new paradigm of creating and deploying applications the _containerization paradigm_ wherein applications and their dependencies are coupled in _container_ structures which can thereafter be transported and deployed in different environments without having to worry about the availability of the application's dependencies as they're available within the container 

> in effect allowing applications to run anywhere much easier

# Docker terminology

---

term
: definition

### _Docker Image_
: is a lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, environment variables, and configuration files. Docker images serve as the blueprint for creating Docker containers.

### _Dockerfile_
: A Dockerfile is a text file that contains a set of instructions for Docker to automate the process of building a Docker image. It describes the steps needed to create the image, such as specifying the base image, copying application files, installing dependencies, and configuring the environment in which the application will run.
 
### _Docker Container_
: is a lightweight, standalone, and executable unit of software that packages up code and all its dependencies, so the application runs quickly and reliably from one computing environment to another. Containers are isolated environments that run on a shared operating system, providing a standardized way to run applications consistently across different environments (e.g., development, testing, and production).

### _Docker Dameon_
: The Docker daemon (dockerd) is the background service that performs all of Docker's core functionalities, including managing containers, images, volumes, and networks. It listens for Docker API requests (from the CLI or remote API) and processes them, allowing users to interact with Docker through the Docker client. The daemon is crucial for orchestrating and managing Dockerized applications.

### _Docker Client_
: The Docker client is the command-line tool that users interact with to manage Docker containers, images, volumes, and networks. It sends API requests to the Docker daemon, which performs the actual tasks of building images, running containers, and handling resources. The Docker client makes it easy to interact with Docker through a series of simple, user-friendly commands.

### _Docker Registries_
: A Docker registry is a service for storing and distributing Docker images. Registries can be public (like Docker Hub) or private (like AWS ECR or self-hosted). Docker registries allow developers to easily push images for sharing and deployment and pull them for use in containers. This system supports image versioning, secure access, and integration into development workflows, making it a critical part of Docker-based application development and deployment.


### Docker architecure

---
> ![Docker Architecture at a high level](https://docs.docker.com/get-started/images/docker-architecture.webp) 

> 

### interaction sequence between Docker components 

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```





