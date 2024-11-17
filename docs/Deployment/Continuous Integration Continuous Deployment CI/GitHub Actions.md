# GitHub Actions

the CI/CD tool I have learnt about and ultimately decided to utilise to deploy my application is GitHub Actions

I chose this because of the preponderance of resources available online about GitHub actions 

the instruction where the test cases that are to be run is specified is within our .github/workflows file 

instead of simple workflow - like the one that is currently operating in the event of a pull request/push to the main branch - the workflow I am going to thereafter write will build the docker image, and run a container from that image upon being triggered

why wont my workflow trigger goddammit

this is now to see how to work with two remote repositories concurrently 

## adding conditions to a workflow so that it executes sequentially rather than in parallel 
rather than 
> on: push and on: pull_request
> on:        on:
    push: /    pull-request





