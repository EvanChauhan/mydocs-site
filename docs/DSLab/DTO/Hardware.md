## Hardware Specifications and Configuration

At a high-level the hardware specifications and configuration of the DSLab platform include

* Registry Servers

1. Non-Production Registry
   - represents a VSI (Virtual Server Instance deployed on IBM Cloud, that is basically the equivalent of an "upstream" Registry Server)
   - "non-prod" hosts an Artifactory instance that can be used to download the required images for all workloads from IBM and other vetted sources
   - Non-prod registry supplies the upstream component required to perform the transfer of content needed to support workloads running on the DSLab Platform. 
        - furthermore the non-prod registry also hosts the dev environment which is ipso facto also non-production in nature. 
        - DSLab engineers develop the tooling used by end users on the DSLan platfrom (like the mission capability application)

    ### Deployed applications

    | Application Name               | Application Role             |
    |------------------------------- | -----------------------------|
    | JFrog Artifactory              | Provides a container image repo that is used in the upstream environment |
    | JFrog Xray | Vulnerability analysis tool used in conjunction with Artifactory, providing image vulnerability analysis and remediation services |
    | GitLab Community Edition | provides code repo, devops and CI/CD service used to support development platform |
  

2. Production Registry
   - represents a "detached" (publicy inaccessible) conventional bare metal server that acts as a Production Registry server for all resources residing on hardware in the Storage Fusion server rack. Providing all required application images/packages for workloads through an Artifactory instance, as DSLab resources availabele on the DPE

* Storage Fusion HCI

* Storage Subsystem