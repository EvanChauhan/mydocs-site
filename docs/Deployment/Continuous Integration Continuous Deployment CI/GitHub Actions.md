# GitHub Actions

the CI/CD tool I have learnt about and ultimately decided to utilise to deploy my application is GitHub Actions

I chose this because of the preponderance of resources available online about GitHub actions 

the instruction where the test cases that are to be run is specified is within our .github/workflows file 

instead of simple workflow - like the one that is currently operating in the event of a pull request/push to the main branch - the workflow I am going to thereafter write will build the docker image, and run a container from that image upon being triggered

why wont my workflow trigger goddammit

this is now to see how to work with two remote repositories concurrently 

## adding conditions to a workflow so that it executes sequentially rather than in parallel 
if we have the case where say the first job is producing some output that the second job requires as input then the sequence of execution becomes important and we cannot have the two jobs executing in parallel as the second job may fail without that input from the first job
to create that sequence of execution add a 'needs' attribute to the second job
rather than 
> on: push and on: pull_request
> on:        on:
    push: /    pull-request


furthermore actions can be customised for the particular repository branch we are working on 
this is represented by 

on: 
    push:
        branches: 
            - develop
            - master 
    pull request:
        branches:
            - master

### side note we can also ignore branches 
- use: branches-ignore

### limitations of workflows
- maximum of 20 workflows can run concurrently (i.e be triggered by one event)

|GitHub Plan| | Concurrent jobs per repo|
|-----------| |-------------------------|
| Free | | 20 |
| Pro | | 40 |
| Team | | 60 |
| Enterprise | | 180 |

furthermore, jobs are capped at a six hour run-time which should be sufficient for whatever jobs your workflows need to complete 

Also, and importantly, actions cannot trigger other workflows as this may create infinite loops of actions triggering workflows and then subsequently workflows triggering other actions ad infinitum 

action logs are capped at 64kb

we can control the execution

the steps to create this pipeline were
1. we created a file in the .github/workflows directory 
2. we call our file complex.yml 
    what is of paramount importance here is that we give it the appropriate extension i.e .yml or .yaml
    within our complex.yml file we give it a name attribute and give it a name in this case Complex
3. then we use the _on_ keyword to specify the trigger that will set off our workflow
4. we use the jobs keyword to list the jobs that our workflow will run 
5. we are able to specify which jobs will execute on whichever os by dileanating these below the jobs field i.e ubuntu: macos: windows:
6. then lastly we are able to use the _needs_ keyword to specify the jobs that this particular job needs to run successfully 

## using actions from the marketplace

this is advisable as it eliminates the risk of you making a mistake

to do this all you must do is navigate to the github marketplace and search for the kind of action you're looking for i.e python syntax checker 

just read under the installation tab and see that the instructions specify that all you are to do is copy and paste into your workflows directory as say marketplace.yml under steps 
> this is important: paste it under steps as this information specifies the steps that are to be undertaken by the workflow

## using actions from other repo's 

this can also be done by    

## passing arguments to a workflow

this is not working correctly for me as it fails at the 'Checkout Apache Tomcat' stage

## Using environment variables

actions may require additional information to be passed to them at runtime. One way to accomplish this is through environment variables

Environment variables represent dynamic key-value pairs that are stored in memory in the virtual environment running our workflow

commands and actions that run as steps can access environment variables to use the information that they hold 

these values are read as the process runs aka they are not already stored in the virtual environment 

they are injected when the environment starts running and prior to any commands being called 

environemnt variables are case sensitive therefore, as a result, when they are referenced in a workflow or a step the reference needs to match the variable exactly as it is defined 

### Default environment variables

- these are dynamic key,value pairs that are stored in memory in the virtual environment running our workflow 
- commands and actions running as steps can access environemnt variables to use the information they hold 
- these values are read as the process runs aka they are not already stored in the virtual environment 
- instead they are injected when the environment starts to run and before any commands are called 
- they are case-sensitive 
- notice each one starts with github in all caps
they're helpful when actions need to know information like the type of event that started the workflow(GITHUB_EVENT_NAME), the person (GITHUB_ACTOR) that triggered the event and the location of the files being used in the workflow (GITHUB_WORKSPACE)

- GITHUB_WORKFLOW
- GITHUB_ACTION
- GITHUB_ACTOR
- GITHUB_REPOSITORY
- GITHUB_EVENT_NAME
- GITHUB_EVENT_PATH
- GITHUB_WORKSPACE
- GITHUB_SHA
- GITHUB_REF
- HOME 

### set your own environemnt variables by creating a block under the env attribute
using the env attribute, variables can be defined at the workflows, jobs and steps level(s) 

### defining environment variables accessibility summary 


|**Variable location**|**access to variable** |
  |  -----------------|---------------  |
    | Workflow |  all Jobs, steps, actions and commands |
    | Jobs  | All steps, actions, and commands within the job |
    | Steps |  The step where the variable is defined |


### Accessing environment variables    

can be accessed in one of two ways 
either using shell variable syntax or by using YAML syntax

using the shell variable syntax:

here variables are passed onto the step's shell to be interpreted 

and are accessed by $VARIABLE_NAME on mac os or on linux

## shell variable syntax ##
- variables are passed onto the steps' shell to be interpreted or accessed within an action by using that action's default shell
- Linux/macOS (here the bash shell is used)
    - in bash, environment variables are accessed like $VARIABLE_NAME
- in a windows environment _powershell_ is used by default
    - here environment variables are accessed like (by a string) $Env:VARIABLE_NAME

in either of these situations the variable will be read from the shell
in other words
the workflow passes the shell value and the shell does the interpretation 

## YAML Syntax ##

- to access a variable using YAML syntax 
> ${{ env.VARIABLE_NAME }}
here the variable is read from the workflow i.e the variable is interpreted before being passed to any steps that use it

because environment variables in .yaml syntax are interpreted at the workflow level they can be used to configure other parts of the workflow

## Secrets ##
- while we can add environment variables to workflows we may need to store sensitive information like passwords or api keys
- secrets are stored as encrypted values in the github repository's settings 
- stored secrets cannot be viewed or edited 
- workflows are limited to 100 secrets and secrets are limited to 64kb
- stored as encrypted environment variables
- access secrets by ${{ secrets.SECRET_NAME }}
- must be explicitly passed to a step or an action 

## Artifacts ##

solves the problem of enabling you to keep something after a workflow has been completed 
the files may be
* compiled binaries 
allow you to be able to pass data between workflow jobs (this seems promising)

because each job runs in a separate virtual environment, when that job is completed the data will be erased 

Because each job runs in a fresh virtual environment, when that job completes that environment is thereafter deleted 

notice below how job2 has a dependency on a file created by the first (job1) job

Job 1 - create and upload the artifact
Job 2 - wait for job 1 to complete 
      - Download and use the artifact

to share the file, job1 created and uploads the artifact 

then job2 waits for job1 to complete, downloads and uses the artifact that job1 creates 
* Artifacts can only be uploaded by a workflow using actions/upload-artifact
    * actions/upload-artifact

* Artifacts can only be downloaded by the uploading workflow where they were created 
    * actions/download-artifact

* manual downloads (after the workflow completes) -> 500 mb available within a free github account for artifacts
* my exercise file for using artifacts is not successfully executing 

## Handling Pull Requests ##

a pull request or PR is made whenever a request is made to merge code from repository into another or when a developer has made a change into a cloned repository and wishes to merge it into the the original repository 

>GitHub actions can be used to automate the entire process of accepting and merging a pull request 

we can use a workflow the approves and merges pull-requests based on specific criteria 

first we run some tests to ensure the code being submitted doesn't compromise the codebase in anyway 

second we check to see if the author is in a list of approved committers 