# Architectural Components

The Digital Solutions Lab comprises three main components

1. Bare Metal OpenShift Cluster
2. Registry Server
3. Storage

Bare Metal OpenShift Cluster | Pods & Containers (Red Hat Operators & Appliactions) Virtual Machines (via OpenShift Virtualization)
|----------------------------|--------------------------------------------|
|Registry Server              | Code and Container Image Repository
|Storage|                     |File|
                             | Block| 
                             | Object|


| Bare Metal OpenShift Cluster | | Registry Server | | Storage | 

| Metal OpenShift cluster  | Registry Server   | Storage     |
|------------|------------|------------|
| Red Hat Applications like Pods and apps | Image and code Repositories | File, Block and Object |


![Conceptual View of DSLab Components](/Users/evanchauhan/development/mydocs-site/docs/DSLab/DTO/DSLab Components.png)

as can be seen from this architectural diagram, the system comprises various hardware, microservices and networking resources currently deployed within the DSLab environment


