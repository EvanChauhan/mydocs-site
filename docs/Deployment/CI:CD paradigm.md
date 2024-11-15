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

i.e every time something happens in your repository be it new code is pushed you can configure automatic options to execute in response

