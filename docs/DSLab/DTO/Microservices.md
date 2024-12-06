### Redhat OpenShift

Red Hat Openshift Container Platform (OCP) is a highly-available platform that can be used for the orchestration of containerised workloads - a 'flavour' of _kubernetes_ if you will and Kubernetes exists as the de jure gold standard for running containerised resources in a production environment.

In comparison to standard Kubernetes, OpenShift provides additional functionality which spans
* Improved cluster security throuhg stricter default container security profiles (including preventing our kubernetes clusters from running with root user privilige - which augurs all kinds of potential ramifications)
    * furthermore Openshift also providees more granular security controls, including comprehensive role-based access (RBAC policies)
* increased ease of deployment and maintenance which is accompished through heavy use of automation tooling. 

### Containers in Cloud Computing context

containers can be treated the same as small virtual machines for our purposes

the primary advantage they provide is that they decouple workloads from the host infrastructure running them: the workloads they contains can be deployed on any HCI node within the stack. 

See this is only possible because of the dependency elimination 

a container will typically only contain the application code for the application that has been containerised 

Apropos the contents of the container, this typically only includes application code and relevant config data. The OS the container runs will typically be quite austere i.e the bare linux kernel + whatever the application actually needs to run

In an Orchestrated container environment - such as the one provided by RedHat with OpenShift - containers will be grouped into workload resources referred to as **pods**

two or more containers that are being combined together will exist as part of the same **pod**

This strategy is useful for applications that may require the correct operation of multuple containers 

for example: think of the environments behind a service mesh such Istio. a second container will normally serve as a proxy for traffic travelling in/out of the pod through the service mesh

### Principles of container workloads

1. Containers typically run one application per container - therefore if two or more applications need to be executed, devise a second container to run the second container and use services to connect the two containers together
2. Containers are LIGHTWEIGHT - unlike the cumbersome Virtual Machine - as the only information within a container is an application's data and configuration it needs to function correctly
3. Apropos security, containers are inherently more secure than traditional server stacks as their workloads are isolated from other containers as well as their host OS (as far as is practicable) - the upshot of which is that if one containerised workload fails, the remaining workloads stand a strong chance of remaining unaffected

### the process 
Containers will typically be built with either Docker or Podman and image files will be stored in a container registry like say DockerHub. Kubernetes or Openshift may run workloads that incorporate these containers

### Advantage of Image layers
Because our container comprises several 'layers', these layers can be reused each time a new image needs to be built.

As a result of this optimisation, the time required to test and deploy new containerised resources is meaningfully lessened 