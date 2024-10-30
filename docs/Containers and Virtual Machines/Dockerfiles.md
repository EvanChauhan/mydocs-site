# Dockerfiles

### what is a Dockerfile and what is it used for

A docker file can be thought of as a language for creating container images (which containers are created thereafter created from)

where as the container images that are created from Dockerfiles are represented by .tar archives joined together by a union file system - this presents a problem i.e the tedium of having to compress each layer by hand

### automating image creation

Dockerfiles present a solution to the automation of image creation problem

the Dockerfile is the default name of the file that Docker looks for when creating container images - everything that needs to be done to create a container image 

![creating docker images from dockerfiles]("docs/Containers and Virtual Machines/creating docker images from dockerfiles.png")

### elaborating the contents of a Dockerfile
every Dockerfile will be a series of _instructions_ each on their own line 
with each instruction represented by the _first word_ in the statement and everything that follows can be thought of as _argument_

in our case

> FROM python:3.10-slim

here *FROM* represents the command and *python:3.10-slim* is the argument 
if there were more words after from they too would be classed as arguments 

### operation sequence

Docker will run every command in an intermediate container - saving the result of every time in an image layer 
these layers will eventually be joined 

### the FROM command

every _Dockerfile_ begins with the *FROM* command - which defines the base image from which the new image will be created
this image is then linked to the new image we are creating

>note: if we were creating a container image from scratch i.e FROM scratch while we could save significant space - it invites the probability that you will mess something up

the exceptions to this is are comments, ARG'S and ENVs can precede a from line

| From | Description | Example |
|------|-------------|---------|
| FROM $**Image** | selects the latest tag of $**Image** | FROM ubuntu |
| FROM $**Image**:$tag | selects the $tag of $**image** | FROM ubuntu:kinetic (this is called version/image pinning) it garuantees that your image will be derived from a specific version of the base image - thereby obviating compaitbility issues and other problems that may be consequences of chosing the latest version of an image |



