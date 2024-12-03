The following will describe the design and sustainment procedures for this site 

- the site is designed using MKDocs Material framework where the content is specified with a series of .md (markdown files) and the configuration of the site is recorded within mkdocs.yml
  
An important fact to remember when editing this mkdocs.yml file is that it is extremely sensitive to indentation so keep this in mind to avoid breaking the site if editing the mkdocs.yaml to customize header/footer/search bar

The site is containerised and executes via shell scripts: build.sh and run.sh

build.sh specifying how to build the docker image and run.sh capturing the command to run a container from this image and bind mount it as a volume thereby allowing for persistent storage

- correctness of updates to the site are ensured through the ci/cd pipeline which goes so far as to ensure all of the links contained within the website are functioning correctly i.e no 404 errors or other erroneous redirects

- furthermore as part of the pipeline - the image is rebuilt every time a pull-request or push to the remote repository is made and it is pushed to DockerHub 

