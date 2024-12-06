## Kubernetes - a container orchestrator

> a kubernetes cluster is a set of machines called nodes that are used to run containerised applications

![kubernetes cluster](https://www.researchgate.net/publication/353390819/figure/fig3/AS:1048498610905088@1626992957043/Kubernetes-cluster-architecture.ppm)

it consists of two core pieces

1. control plane 
2. 

### Introduction to kubernetes 

From monolithic to microservices:

Legacy technologies which feature extensive inseparably coupled components present a nightmarish situation to manage and deploy on expensive hardware 

today most applications are deployed in the cloud 

it is exceedingly difficult to for example convert an application to become cloud ready when it currently exists as a 'black box' that is to say information pertaining to how it operates is not available 

## the first challenge: the legacy monolith

how can legacy applications be modified to be suitable for the cloud 

the archetypal monolithic application can be likened to sedimented layers of features and redundant logic translated into thousands of lines of code, written in a single, not so modern programming language, based on outdated software architecture patterns and principles.

as a consequence there is significant associated hardware cost to operating a storing the typical monolithic application as it will often have to run on a single system which has must shoulder the burden of satisfying its oftentimes non-trivial operational requirements: compute, memory, storage and networking.

This hardware is not only likely to be expensive but also difficult to procure

the deathknell for the monolithic application is that often it runs as a single/consecutive process making it virtually impossible to scale. It likely internally supports a hardcoded number of connections. There is a solution still: manually deploy the application on another server with the assistance of a load balancer - though this is not inexpensive

and lastly, upgrading the system will present a challenge as clients will be disrupted and any attempt to minimise the disruption via say third party solutions to set up applications in a highly available active/passive configuration will see a host of new challenges for the system engineers to keep all systems appropriately patched

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

------------|-------------------
Appdirect   | end-to-end e-com platform


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

* Nodes - compute nodes capable of hosting o=containers running on the cluster. For example our HCI compute nodes that run on the DSLab platform's OpenShift Cluster

Most clusters are configured to run in a highly-available setup i.e if one node fails, its workloads can be moved to another 'health' compute node except for in the case of say a GPU-accelerated workload

* Services - network endpoints within the cluster that act as points of ingress and egress for traffic to and from the Pods. Typically these network endpoints are configured to target Pods with a certain metadata label attached to them; the Kubernetes network CNI uses these labels to enable basic routing between workloads wtihin the cluster

* Pods - usually consist of one or typically more containers that are deployed to run and support the execugion of an application that is hosted on a Kubernetes cluster - representing base-level workloads that are deployed ont he cluster and are usually deployed according to a *Deployment, StatefulSet*or *DaemonSet* all of which define the desired state of a workload being put on the cluster

As anticipated, to overcome issues with wider network exposure we can leverage resources like **ingress** in Kuberentes and **Route** in OpenShift. 

Like a router within a generic wireless network, a router resource can serve as the entry/exit point for ingress traffic and with an appropriate network IP address, will expose an endpoint for our application to use on a public network and when we see traffic from said network, the router will then direct that traffic to the correct application running on our cluster.

This truly represents the sufficiently advanced technology that has become indsitinguishable from magic

![A Basic Ingress model](https://mermaid.live/view#pako:eNqNkstuwyAQRX8F4U0r2VHqPlSRKqt0UamLqtnVzgKbcYyCweLRh5L8e3EhctxuuvHAncvxMMMe14oBJriUW037Fj2_LkqJUC04SHtRhLi5zGboyTvAmKyjkm6BoYdKL5FQlKGKCipr0GiWLXlwFdG9-aFFMcuWB62c9VuknYCDAf3OayjWIQazcVUopRbOWNBngJAPZg_rFbsqXhTb_NXzUQfJwo2oMStoUC8ol6jhQpCEMZYaq9UOSNI0TVxnH5zZltz0n2mthNIkmc_niwlkd28i4jq_q-H2XxSfm1LiDSNpPEqSqqqmmHzEhD-OpFN30tiBdOjL8MmHMs98YZihARM5VBGjz5QSp7gD3VHO_NvYD94S2xY6KDHxSwYNdcKW_tkcvZU6q9ZfssbEagcp9kPetpg0VBi_cz2jFlac-rF2J0tP5ZtS3S_TI-NW6SgevwH5Tupi)