# -e exits if any of the lines fails
# -x prints each command that is going to be executed with a little plus
set -ex

docker run --rm -p 8000:8000 -v ${PWD}:/app --name my-docs -d evan.chauhan/my-mkdocs-site:1.0 