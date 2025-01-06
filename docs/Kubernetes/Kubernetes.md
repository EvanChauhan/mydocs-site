## Kubernetes - a container orchestrator

## some desireable pre-requisite concepts 


> a kubernetes cluster is a set of machines called nodes that are used to run _containerised_ applications

![kubernetes cluster](https://www.researchgate.net/publication/353390819/figure/fig3/AS:1048498610905088@1626992957043/Kubernetes-cluster-architecture.ppm)

it consists of two core pieces

1. control plane 
2. nodes

### Introduction to kubernetes 

From monolithic to microservices:

Legacy technologies which feature extensive inseparably coupled components present a nightmarish situation to manage and deploy on expensive hardware 

today most applications are deployed in the cloud 

it is exceedingly difficult to for example convert an application to become cloud ready when it currently exists as a 'black box' that is to say information pertaining to how it operates is not available 

the need for kubernetes emerged from the growing trend in microservices based architecture being preferred over monolithic for a variety of reasons. 

Kubernetes provides the perfect host for small independent applications that leverage a microservices based architecture instead of monolithic.

Kubernetes can be used to orchestrate the containers that comprise a large application that consists of ~hundred containers each providing a specific function 

Kubernetes garuantees 
* high availability and consequently little to no down time
* high scalability which helps to accommodate different levels on traffic on the application 
* disaster recovery - provides a backup and restoration functionality

## the first challenge: the legacy monolith

how can legacy applications be modified to be suitable for the cloud 

the archetypal monolithic application can be likened to sedimented layers of features and redundant logic translated into thousands of lines of code, written in a single, not so modern programming language, based on outdated software architecture patterns and principles.

as a consequence there is significant associated hardware cost to operating a storing the typical monolithic application as it will often have to run on a single system which has must shoulder the burden of satisfying its oftentimes non-trivial operational requirements: compute, memory, storage and networking.

This hardware is not only likely to be expensive but also difficult to procure

the deathknell for the monolithic application is that often it runs as a single/consecutive process making it virtually impossible to scale. It likely internally supports a hardcoded number of connections. There is a solution still: manually deploy the application on another server with the assistance of a load balancer - though this is not inexpensive

interesting to note - service is itself a kind of load balancer - catching requests and forwarding them to the appropriate(least busy) pod

in order to for example create a second replica of our application pod the approach is not to create a second pod but instead to define a blueprint for your application pod 

specifiy the number of replicas you want that pod to run

this blueprint is a **deployment** kubernetes component 

in practice we do not create pods, we create deployments as there we can specify the number of replicasets and scale up and down the number of replica pods that we need

we concluded previously that pods represent a layer of abstraction on top of containers now deployments are another layer of abstraction above pods - increasing convenience in interacting with pods

what about the database pod? It is crucial that this is running and importantly **this pod cannot be replicated with a deployment** because a database maintains a state therefore, clones/replicas of a database all need to access the same shared data storage which demands an external mechanism to manage resource allocation i.e which pods are currently writing to our storage to avoid any data inconsistencies 

this mechanism is provided by statefulset and is meant specifically for concurrency sensitive applications like databases

any statefulset application or database should be created with stateful set and not a deployment

however, the challenge with deploying StatefulSet applications within a Kubernetes cluster can be tedious and is ipso facto more difficult than working with a deployment 

therefore it becomes common practice to host database application outside of the cluster and leave the deployments or stateless applications that replicate and scale with fewer problems inside of our cluster and can communicate with an external database 

the upshot of this is we have 2 load-balanced replicsas of our application pod and two load-balanced replicas of the database which provides the advantage that if one node is 'lost' entirely, the application can still be accessed by the user

and lastly, upgrading the system will present a challenge as clients will be disrupted and any attempt to minimise the disruption via say third party solutions to set up applications in a highly available active/passive configuration will see a host of new challenges for the system engineers to keep all systems appropriately patched

with these components alone we are able to build powerful kubernetes clusters

### pebbles and boulders
Pebbles, as opposed to the 1000-ton boulder, are much easier to handle. They are carved out of the monolith, separated from one another, becoming distributed components each described by a set of specific characteristics

pebbles (the distributed components) can be combined to deliver the full functionality promised by the boulder 

each pebble (our microservice) performs a business function and together fulfill the requirements of the original boulder (monolith)

each microservice can be deployed on a separate server provisioned with fewer resources only what is required by each service and the host system itself, helping to lower compute resource expense

## Microservice architecture

Microservice based architecture is aligned with event-driven architecture and service-oriented architecture principles where complex applications are composed of small independent process which communicate with each other through API's over a network

## Refactoring

Modernity:

Newer, more modern enterprises possess the knowledge and technology to build cloud-native applications that power their business.

Unfortunately, that is not the case for established enterprises running on legacy monolithic applications.

### incremental refactoring

with this approach new features are added as modern microservices which are able to communicate with the monolith through API's without appending to the monolith's already copious source code. Simulataneously refactoring features out of the monolith causes it to slowly erode as most of the functionality it provided is now provided by microservices.

[Refactoring monolithic applications to microservices](https://cloud.google.com/architecture/microservices-architecture-refactoring-monoliths)

### the challenges accompanying refactoring 

several questions need to be answered to perform this well:

1. which components should be separated out from the monolith to become microservices
2. how to decouple databases from the application logic thereby separating data complexity from application complexity

### The advantages of cloud-native

through refactoring, our historically monolithic application has a second chance at life. By becoming a cloud-native applciation the application can exploit cloud features, fully integrate with cloud automation tools and services 

### Introducing the Modern microservice 
The Kubernetes Project represents a container orchestration tool used for managing automating software deployment

### the challenges of refactoring

[common challenges that accompany refactoring](https://flatirons.com/blog/what-is-code-refactoring/)

not all application are suitable for refactoring into microservices and may die during the modernization phase

candidacy can be assessed on:

- if the application is written in something like Assembler or Cobol it will be more prudent to build it from the ground-up as a cloud native application than to refactor into a microservices configuration

- a poorly designed legacy system should be refactored to be compliant with SOLID principles and rebuilt from the ground up following more modern architectural patterns for microservices and even containers. Tight coupling with data stores may disqualify an appliction from meaningful refactoring

### post refactoring

Once the monolith survived the refactoring phase, the next challenge is to design mechanisms or find suitable tools to keep alive all the decoupled modules to ensure application resiliency as a whole.

> in response to these refactoring challenges we saw: 
Application containers - providing encapsulated lightweight runtime environments for application modules

they 

it works in tandem with docker


### Mononlith to Microservices - success stories and examples

| Company     | Description                  |
|-------------|------------------------------|
| Appdirect   | end-to-end e-com platform    |

## what are the problems that have been outsourced to Kubernetes 

and therefore what are the tasks accomplished by a container orchestration tool

managing loads of containers across multiple environments has turned out to be impractical using scripts and 'self-made' tools

this created a demand for a 'proper' or more robust way of managing these hundreds of containers 


### some terms

_monolith:_ a large footprint application, written in a legacy programming language, with tightly coupled features, running on a dedicated, large, and expensive server?

a feature that is introduced by microservices once an application is refactored is Modularity 

a legacy mainframe application written in an old programming language like cobol and tightly coupled with its data stores makes for a poor candidate for modernization through refactoring 

## Container Orchestration

while we know that container images provide the confines for our application code, it's runtime and dependencies within a pre-defined format

container runtimes like runC, containerd and CRI-O use pre-packaged images as a source to create and run containers 

these runtimes will containers on a single host but we will oftne want a fault-tolerant and scalable solution which ipso facto involves a single controller/management unit, a collection of multiple hosts connected together

this controller/management device is referred to as the _container orchestrator_

Containers represent an application-centric method to deliver high-performing, scalable applications on any infrastructure of your choice.

they lend themselves well to deliver microservices by providing portable and isolated virtual environments for applications to run with minimal interference other running applications: a significant degree of isolation

### Container Orchestration 

*Container review*

![another view of containers and interaction with the Operating System](/Users/evanchauhan/development/EvanChauhan/docs/Containers and Virtual Machines/container_and _the _OS.png)

these containers, represent an application-centric method to deliver high-performing, scalable applications on any infrastructure of your choice.

they greatly facilitate the delivery of microservices by providing isolated virtual environments where applications can run with minimal interference from other running processes/applications.

*Container deployment options* 

a *Microservice* is a lightweight application written in any combination of modern programming language, with their specific dependencies, libraries and whichever other requirements packaged/combined together within a 'container'

therefore it is correct to say that containers encapsulate microservices and their dependencies without running them directly. Containers run the configuration that is specified within the container image from which they are created 

A container image couples the containerised application along with its runtimes, libraries and dependencies, representing the source of the container deployed to offer an isolated executable environment for the application 

A container can be deployed from a container image on many platforms including workstations, virtual machines and public cloud 

while in DEV environment where running containers on a single host for development and testing may be acceptable, when migrating to a QA environment or alternatively a production environment even this is no longer viable because applications and services have to meet specific requirements such as but not limited to 
* fault tolerance
* on-demand scalability
* Optimal resource management/usage
* Auto-discovery to automatically discover and communicate with each other (this seems particularly challenging to implement)
* connection to and therefore accessibility from the outside world 

Container Orchestrators are tools which group systems together to form clusters where containers' deployment is automated at scale while meeting the above itemised requirements. Through this arrangement (the clusters approach) we are able to exploit a distributed systems arrangement which leads to improved performance, reduced latency, cost efficiency and more equitable workload distribution 

there is a legitmate growing need for further container orchestration solutions 

[Refactoring monolithic applications to microservices](https://cloud.google.com/architecture/microservices-architecture-refactoring-monoliths)

### Container Orchestrators

the demand for container orchestrators comes from enterprises realising the usefulness of containers and thereafter containerising their applications and moving them into the cloud

today a litany of options are available with Amazon Elastic Container Service, Azure Container Instances, Azure Service Fabric, Azure Service Fabric, **Kubernetes** and Docker Swarm to name a subset 

### Advantages of Container Orchestration

sure it is possible to maintain some half-a-dozen containers or write scripts to manage the lifecycle of some groups of containers i.e run.sh and exec.sh, container orchestrators make management **significantly** easier for managing hundreds or even thousands of containers running on a global infrastructure

the features container orchestrators typically can provide include

* being able to group hosts together while creating a cluster, in order to leverage the advantages of distributed systems 
* address resource availability in container scheduling
* enable communication between containers in a cluster regardless of whichever host they are deployed to
* bind containers with storage resources 
* Group sets of similar containers, binding them to load-balancing constructs to simplify access to containerized applications by creating an interface, a level of abstraction between containers and our client
* each of our worker nodes will have a kubelet process that runs on it
* each of these worker nodes is where the 'actual work is happening'
    * As a result they typically have the highest workloads 

### Container orchestration deployment options

container orchestrators can be deloyed anywhere (that is to say on any infrastructure of our choice: be it physical machines, on-prem or on public and hybrid cloud)

Kubernetes for example can be delpoyed on a workstation with or without an isolation layer like a local hypervisor or container runtime, inside a company's data center, in the cloud on AWSElastic COmpute CLoud (EC2) instances, IBM servers, GCE (Google Compute Engine) VM's

Additionally we have turnkey cloud solutions which allow production clusters to be installed, with only a few commands, on top of cloud infrastructure-as-a-service. These solutions paved the way for the managed continaer orchestration-as-a-service more specifically, the managed Kubernetes-as-a-Service (KaaS) solution, offered and hosted by most major cloud providers. Examples of KaaS solutions are Amazon EKS, Azure AKS, Google Kubernetes Engine (GKE)

### in summary

Benefits of container orchestration include
* fault-tolerance
* Optimal use of resources
* scaling the applications

Container Orchestrators can
* Schedule containers on different nodes
* help connecting container deployed to different hosts on the same cluster

Our beloved _Kubernetes_ is known as a Container Orchestrator

## Kubernetes

"Kubernetes is an open-source system for automating deployment, scaling, and management of containerised applications"

- Kubernetes web site

- the word Kubernetes comes from the greek κυβερνήτης - which means helmsman or ship pilot/captain

we will commonly see kubernetes called **k8s** to indicate the eight characters been the leading k and the ending s

From Borg to Kubernetes

from Google's 2016 paper

_The Google Borg system is a cluster manager that runs hundreds of thousands of jobs, from many thousands of different applications, across anumber of clusters each with ~ten's of thousands of machines.

For more than a decade, Borg has been Google's secret, running its wordlwide containerized workloads in production. Services we use from google including Gmail, DRvie, Maps, Docs are all serviced using Borg. Because so many of Kubernetes' initial authors were Google 

# Kubernetes features

the rich set of features for container orchestration Kubernetes offers include

* Automatic bin packing -> with Kubernetes containers can be scheduled based on resource needs and constraints, to maximise utilization without sacrificing availability

* extensibility -> a cluster can be extended with new custom features without modifying the upstream source code

* self-healing -> Kubernetes automatically replaces and reschedules containers from failed nodes - terminating and then restarting containers that become unresponsive to health checks, based on existing rules/policies - thereby preventing traffic from being routed to unresponsive containers

* horizontal scaling -> kubernetes scales applications manually or automatically based on CPU or custom metrics for utilization

* service discovery and load balancing -> Containers receive IP addresses from Kubernetes, while it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing requests across the containers of the set.

In conclusion, Kubenetes supports PaaS specific features which include application, deployment, scaling and load balancing while allowing users to integrate their desired customisations aporopos monitoring, logging and alterting solutions through optional plugins 

## the case for Kubernetes adoption

Kubernetes can be deployed in many different environments including both local and remote virtual machines, 'bare metal' or in public/private/hybrid-and-multi cloud setups

### terminologies

a typical OpenShift/Kubernetes cluster will house the following key resources

* Nodes - compute 
s capable of hosting containers running on the cluster. For example our HCI compute nodes that run on the DSLab platform's OpenShift Cluster

> A node is a virtual or physical machine 

Most clusters are configured to run in a highly-available setup i.e if one node fails, its workloads can be moved to another 'health' compute node except for in the case of say a GPU-accelerated workload

* Services - network endpoints within the cluster that act as points of ingress and egress for traffic to and from the Pods. Typically these network endpoints are configured to target Pods with a certain metadata label attached to them; the Kubernetes network CNI uses these labels to enable basic routing between workloads wtihin the cluster

* Pods - usually consist of one or typically more containers that are deployed to run and support the execugion of an application that is hosted on a Kubernetes cluster - representing base-level workloads that are deployed ont he cluster and are usually deployed according to a *Deployment, StatefulSet*or *DaemonSet* all of which define the desired state of a workload being put on the cluster
> basic unit of Kubernetes is the pod
> the pod is like an abstraction layer on top of the container or a running environment for our containers 
that is to say we only interact with the kubernetes layer not the individual containers as Kubernetes abstracts away this information

the reason for this abstraction is so that you can replace the underlying container technology - whatever it may be i.e Docker, Podman etc - without it impacting the overall state of your application

> the upshot of this abstraction is that the user only interacts with the Kubernetes Layer 

Typically we will only find **one** application running (within a container) within a pod

however, this is not a reqirement - it is entirely possible to have one main application container as well as some like for example side service or helper containers for the application to also be running within the same pod

in our example we only see one server with two containers running within it with an abstraction layer ontop of it

As anticipated, to overcome issues with wider network exposure we can leverage resources like **ingress** in Kuberentes and **Route** in OpenShift. 

Like a router within a generic wireless network, a router resource can serve as the entry/exit point for ingress traffic and with an appropriate network IP address, will expose an endpoint for our application to use on a public network and when we see traffic from said network, the router will then direct that traffic to the correct application running on our cluster.

Via Kubernetes ootb virtual networking - each pod has it's on ip address (internal ip address - not a public ip address)

>pods are (like Docker containers) ephemeral - which means they are not persisted (and 'die' very easily)

Service and Ingress are used in response to the issues that emerge from the ip address changing every time your pod restarts - this can be a source of great frustration if for example you're communicating with a database via ip addressing and your ip address changes everytime the pod restarts. To circumvent this, we use another Kubernetes component called service

**Service** includes a static/permanent ip address that can be fixed to each pod 

your application will have it's own service

and the database pod will have it's own services; separation of services

as a result of this - the lifecycle of a service and a pod are not connected the advantage of this is if the pod dies - due to the disconnection of service from pod - the service and it's ip address remain unaffected - ergo one less endpoint to worry about having to change

Importantly, the lifecycle of the service and the pod are not connected in any way so therefore even if the pod dies the service and it's ip address remain unaffected 

>the upshot of this is that you wont be required to change that endpoint anymore

for you applciation to be accessible through the browser, you typically have to create an *external service*
that is a service from external channels that opens the communciation to external services 

but because you wouldn't want for example your database to be open to public requests you would use an **internal service** instead of an external service - an external service is a service that opens the communication from an external source

with an internal service, you must specify that it is internal when you create it

unfortunately the url this is likely to return is something like
http://124.89.101.2:8080

* http protocol 
* node ip address i.e of the node not the server
* port number of the service
whilst this is acceptable for testing services, it is not for your final/end product - usually you would prefer a url more like https://my-app.com as opposed to http://124.89.101.2:8080 i.e a node ip address

to establish this superior url - we use the ingress component that Kubernetes provides us 
This truly represents the sufficiently advanced technology that has become indsitinguishable from magic

![A Basic Ingress model](https://mermaid.live/view#pako:eNqNkstuwyAQRX8F4U0r2VHqPlSRKqt0UamLqtnVzgKbcYyCweLRh5L8e3EhctxuuvHAncvxMMMe14oBJriUW037Fj2_LkqJUC04SHtRhLi5zGboyTvAmKyjkm6BoYdKL5FQlKGKCipr0GiWLXlwFdG9-aFFMcuWB62c9VuknYCDAf3OayjWIQazcVUopRbOWNBngJAPZg_rFbsqXhTb_NXzUQfJwo2oMStoUC8ol6jhQpCEMZYaq9UOSNI0TVxnH5zZltz0n2mthNIkmc_niwlkd28i4jq_q-H2XxSfm1LiDSNpPEqSqqqmmHzEhD-OpFN30tiBdOjL8MmHMs98YZihARM5VBGjz5QSp7gD3VHO_NvYD94S2xY6KDHxSwYNdcKW_tkcvZU6q9ZfssbEagcp9kPetpg0VBi_cz2jFlac-rF2J0tP5ZtS3S_TI-NW6SgevwH5Tupi)

via ingress, the request first goes to ingress which then forwards it to service 


# Kubernetes Architecture #
> a high level view
> Kubernetes can be described architecturally as a cluster of compute nodes categorized by their distinct roles:
including
* One or more control panel nodes
* and one or more worker nodes(these are optional but recommended to support the control panel nodes)

![Kubernetes Architecture diagram](https://d36ai2hkxl16us.cloudfront.net/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/bpcsp24duwc1-TrainingImage.png) 

![architecture diagram simplified][development/mydocs-site/docs/Kubernetes/kubernetesarch.png]

# the nodes

a node represents a physical or a virtual machine with compute and storage functionality 

the **control plane node** provides a running environment for the control plane agents responsible for managing the state of a Kubernetes cluster

it is like the nucleus of the cluster - the intelligence behind all operations of the cluster 

control plane components are agents with very distinct and important roles within management of the cluster

to interact with the cluster, a user sends messages to the control node via the cli, web ui, or via a dashboard or lastly via an api

the API server is the entry point to the cluster - this represents the feature that kubernetes clients interact/interface with

to talk to the api server you use one of it's clients like for example ui clients, kubernetes api or a command line tool like kubectl (most powerful of the 3 clients)

once kubectl submit commands to the api server ot create components then the worker proecsses on our minikube nodes actually actuate the command - for example creating/destroying the pods and services

kubectl is quite powerful - it can operate with multiple types of cluster set ups, be they cloud clusters or minikube clusters, kubectl cna interact with kind of cluster

then we have a controller manager which runs on the master node as well and provides an overview of what is happening in the kubernetes cluster

and lastly a scheduler which is responsible for orchestrating the replacement of pods and for scheduling containers on different nodes based on workloads and resource availability (this is very impressive technology for this to be operating autonomously!)

lastly, etcd key value storage which holds at arbitrary point in time the state of the kubernetes cluster

we can recover the whole cluster state with an etcd snapshot as it saves the entire state of the cluster

this represents and intelligent process which decides on which worker node the next process should be scheduled on

prime importance should be given to keeping the control node running as, if the control plane is lost the entire cluster is not operational and this disruption will likely cost the business 

# System Design Exercise

let's build a simple web application which has a simple database using Kubernetes components using each of the following Kubernetes components 
* Pod
* Service
* Ingress
* ConfigMap
* Secret
* Deployment 
* StatefulSet
* DaemonSet


if you lose access to your master node you won't be able to access the cluster anymore - so it is recommended to keep a backup of your master node k

in a production environment - standard practice is to have two master nodes within your Kubernetes Cluster

within our exceedingly simple set up we have only one server and a couple of containers running and some services 
with this simple set up we're unable to see Kubernetes advantage/cool features come to the fore

Because pods communicate by using a service, our example application may have a database endpoint called for example mongodb service that it uses to communicate with the database 

this configuration will most often be found within the built image of the application 
for example if the endpoint of the service or the service name changes to mongodb, you have to adjust that name within the application

rebuild the docker image of your application, push this to your repository, and then pull this image into your kubenetes cluster or pod (i think pod)

because of how tedious this process is that needs to execute every time an endpoint name changes, Kubernetes uses _config maps_ 

this is basically the external configuration to your application that contains configuration data like for example url's of databases so what's required of you is only to connect these to your pod so that pod actually gets the data that config map contains

now if you change the name of the service or the endpoint of the service, you only adjust the config map, not rebuild the image. Thus this solution with config maps greatly lessens the computational energy required 

just like github, Kubernetes has a _secrets component_ 

as putting sensitive information like passwords in a config map in plain text format would be insecure, we instead use **secrets**

the beauty of secrets are that information stored in secrets is not stored in plain text format but instead in base 64 encoded format so really any information that you don't want other people having access to goes in secrets

base 64 encoding a secret does not make it secure ipso facto 

secrets are encrypted using third part tools in kubernetes as kubernetes doesn't have encryption functionality ootb

connect your secrets to your pod so that the pod can read from secrets 

and connect pod to config map so your pod can see the data there too

environment variables can be used to leverage data inside of config map or secrets inside of your application pod 

# Volume and data storage 

say we have a database pod which our applciation uses and this pod generates some data - now just like with containers, if that database container or pod is restarted that data which we have saved will be lost

this presents as a problem, obviously, because we would like our database data to be reliably persisted long term

this can be overcome and data can be persisted long term by using (much like in Docker) Kubernetes volumes i.e attaching physical storage on a hard drive to our pod or in remote storage i.e outside of our kubernetes cluster

this storage can be on a local machine i.e on the same server node where the pod is running or within remote i.e outside/external storage or cloud storage - now when our database pod or container restarts, all the data we have saved is peristed much like with a docker volume once a container exits, the volume (by bind mount) persists the data

there is a distinction/demarcation between the kubernetes cluster and storage
> regardless of whether we have local or remote storage, any storage can be conceptualised as an external hardrive that is plugged in/connected to our kubernetes cluster

the upshot of this is the revelation that our kubernetes cluster does not indigineously manage any storage or data persistence hence responsibility for managing and backing up data ensuring it is kept on proper/robust hardware is on the kubernetes user

Kubernetes does not maintain data persistence - which translates to you as the Kubernetes user being responsible for backing up any data

# deployment and stateful set 

lets suppose our application is running successfully and a user is able to access it via a brower - then what happens if your application pod dies/crashes/requires restart

this will necessitate a 'downtime'

instead of relying on a single service - we utilise a distributed systems approach through multiple application containers - we are able to replicate all application components across multiple nodes - that is to say on multple servers

# the node and the pod

# using minikube

minikube is our tool of choice for starting up/deleting the cluster 
cubectl is our tool of choice for configuring the minikube cluster

usually we will not be manipulating a pod directly - as instead we interact with the abstraction layer that is known as deployment

> kubectl create deployment NAME --image=image [--dry-run] [options]

as part of an exercise we use minikube to create a single node kubernetes cluster 

## Practical training to create Kubernetes pods and configuring a Kubernetes cluster

all Kubernetes configuration goes through a master node in a process called API server (the only entry point into the kubernetes cluster)

all these requests to API server are made in .json or yaml format

example configuration:

> apiVersion: apps/v1
  kind: deployment 
  metadata: 
    names: my-app
    labels:
        app: my-app
   spec:
    replicas: 2
    selector:
        matchlabels:
            app: my-app
    template:
        metadata: 
          labels: 
            app: my-app
        spec: 
            containers:
              - name: my-app
                image: my-image
                env: 
                    - name: SOME_ENV    
                      value: $SOME_ENV
                ports: 
                    - containerPort: 8080

what this instruction is doing is:
sending a request to kubernetes engine to configure a Deployment (that is a template for creating pods)
in this case 2 replica pods with each pod having a container which is built from my-image

then we configure some environment variables 

these configuration requests are made in declarative format 
is == should 

notice how we have declared 2 replica pods of our my-app deployment for kubernetes to try and deliver 

since we have declared that we want two replica pods of my-app to be running in the cluster 

say one of those pods dies 

the controller manager detects that the is and should states are different and will try to recover the desired state

the three components to a k8's configuration file

the first part is where the metadata of the component that we are creating will reside

the second component is the specification - each component's configuration file has a specificationn  

deployment                                      Service 
                                                apiVersion: apps/v1
                                                kind: Service
                                                metadata:
                                                    name: nginx-service
                                                spec:
                                                    selector: ```
                                                    ports: ```                                      
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  lables: ```
spec:
  replicas: 2 
  selector: ```
  template: ```

self-healing if there is a mismatch between the desired state and actual state of a component - Kubernetes automatically actions a healing process 

## the third component to a specification file
1. metadata
2. specification
3. status > automatically generated compares desired and actual states of our components 

# regarding Status 

kubernetes is always comparing the desired state to the actual state
and in the event of a mismatch, Kubernetes a

inside of specification - the specific attributes are specific to the particular kind of component you're creating

k8s is updating the state of your deployment continuously
it compares the status with the speciifcation and will create another replica if there is a need 

# where does Kubernetes collect the status data of our cluster from

it comes from the etcd - that is the cluster brain i.e one of the maste processes that actually stores our master data 

etcd holds at any time the current status information of any kubernetes component

store your configuration files (yaml files) with your application code 

# Minicube/kubectl

a typical production cluster has 
- multiple master nodes and multiple worker nodes which at the lowest layer

because of the resources required to set up a cluster (i.e the number of nodes)

within our kubernetes cluster we are running Docker containers 

to allow this to happen our Minikube installation has Docker pre-installed 

Docker acts as a driver for Minicube which translates to ' we are hosting Minikube as a container on our local machine ' i.e we are hosting minikube on our local machine within a Docker container? I don't fully understand why this would be advantageous 

to summarise

1) minikube runs within a Docker container
2) Docker within minikube runs our application containers

> we have two layers of docker: 

minikube comes with docker pre-installed to be able to run our containers 
and we are hosting minikube within a docker container itself 

layer 1: minikube running inside a docker container 
layer 2: docker running inside minikube to run our application containers

lastly to host minikube on our local machine we use Docker

> minikube - used to start up/instantiate the cluster and 
kubectl - use to configure the cluster

with minikube - we have both master and worker processes running on the one node 

using kubectl (command line tool for kubernetes clusters) - remember that minikube can run both master and worker processes

# Demo project

we will now deploy a very realistic albeit simple application set up within a kubernetes cluster

we will deploy a mongo db database and a web application that connects to the mongodb database using external configuration data that uses ConfigMap and Secret and finally this web application will be accessible from the browser