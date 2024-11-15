### Continuous Deployment with GitHub Actions 

the objective behind what we're trying to accomplish with ci/cd tooling is to work towards a repeatable happy build for our docker images 

### Continuous Integration and Continuous Deployment represent a devops paradigm where

whenever we have an event i.e some new code is pushed to the remote repository, a deployment to the remote repository a serieswill be provoked where some commands will run:

we will rebuild our container image from our dockerfile which specifies things like our mkdocs version, python version etc

>docker image build -t evan.chauhan/my-mkdocs-site:1.0 .

then after the image is built we will run our mkdocs build inside a container from this image using the docker run command and we'll mount a docker volume so that the changes are persisted each time the container is stopped and it resumes

>docker run --rm -p 8000:8000 -v ${PWD}:/app --name my-docs -d evan.chauhan/my-mkdocs-site:1.0 

