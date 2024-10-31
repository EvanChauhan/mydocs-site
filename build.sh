# -e exits if any of the lines fails
# -x prints each command that is going to be executed with a little plus
set -ex

# SET THE FOLLOWING VARIABLES
REGISTRY=evan.chauhan
IMAGE=my-mkdocs-site
TAG=1.0

docker build -t $REGISTRY/$IMAGE:$TAG .