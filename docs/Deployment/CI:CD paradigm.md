### Continuous integration and Continuous deploymen

CI/CD represents a foundational modern software development paradign that aims to bridge the gap between software development (typically the prerogative of a development team) and IT operations (typically the prerogrative of an operations team) 

it accomplishes this by automating key steps within the software development lifecycle (SDLC) including integrating new code changes, running automated tests and deploying software changes into different environments

really, a CI/CD pipeline is indispensible for rapid, reliable and frequent delivery of applications

### what is CI/CD

> Continuous Integration (CI) describes a development practice that aims to improve collaboration, detect errors/bugs early 

>whenever something happens to your repository i.e code is pushed you can configure certain things to happen i.e run a regression test suite to ensure functional correctness of the code before it is merged into the master branch for example

> the stages of deployment can be loosely categorised as merge code -> test merged code -> build -> deploy

### what is github actions

>github actions is a platform to automate developer workflows which in this case translates to build a set of tests that are to be run on newly committed code 

that is to say github actions is used as a CI/CD tool

i.e every time something happens in your repository be it new code is pushed you can configure automatic options to execute in response i.e an automated workflow that you can configure to execute automatically for example sort, label assign it to a contributor - whatever it is - an automated workflow is triggered in response to an event 

this is the CI/CD paradigm at its core

whatever action you wish to occur upon being triggered can be automated with GitHub actions 

that is to say a workflow can be built which is comprised of a chain of actions that execute automatically upon an event i.e running tests on some code that is being pushed to the repository before merging it into the master branch 

### reason for selecting github actions over other ci/cd tools like openshift pipelines or jenkins

1. github actions has a free tier 
2. it is already integrated with github - the place where the source code is stored so it obviates the need to integrate an external tool were I to select one 

> an importnat consideration when building ci/cd pipelines is their integration with different tools 
as having to integrate tools that don't lend themselves to an easy integration is unpleasant and to therefore to be avoided 

this is an advantage of using ci/cd pipelines within github actions 

to build the rather complex pipeline i.e build the docker image, run a container from that image every time new code is pushed remote

### developing the pipeline

we can develop a ci/cd pipeline using github actions that gets triggered upon each push/pull request to the master branch of our repository

each time the pipeline is triggered i.e on each push to the master branch of our repository the workflow runs a series of jobs, steps and actions