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

# Mechanics of Docker

---

> docker takes a innovative approach by establishing a new paradigm of creating and deploying applications the _containerization paradigm_ wherein applications and their dependencies are coupled in _container_ structures which can thereafter be transported and deployed in different environments without having to worry about the availability of the application's dependencies as they're available within the container 

> in effect allowing applications to run anywhere much easier

# Docker terminology

---

term
: definition

_Docker Image_
: here is a practical definition of a docker image

_Dockefile_
: here is the concept of a dockerfile + elaboration on Dockerfiles
 
_Docker Container_
: here is the related concept definition of a docker container

_Docker Dameon_
: here is the related concept definition of the docker daemon

_Docker Client_
: here is the related cocnept definition of the docker client

_Docker Registries_
: here is the related concept definition of rocker registries 


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





