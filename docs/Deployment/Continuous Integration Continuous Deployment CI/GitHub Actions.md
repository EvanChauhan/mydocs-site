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







