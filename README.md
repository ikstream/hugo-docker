[![Docker](https://github.com/ikstream/hugo-docker/actions/workflows/docker-publish.yaml/badge.svg?branch=main)](https://github.com/ikstream/hugo-docker/actions/workflows/docker-publish.yaml)

# Hugo docker image

The static site builder in a container. 
----
This image is build weekly on Sunday evening using docker actions in https://github.com/ikstream/hugo-docker

To run it with a command prompt run it in your the directory you want to use it with

```
docker run --name hugo -it -p 1313:1313 -v $(pwd):/src/ --rm localhost/hugo
```

This will mount your local directory into  the docker container and expose port 1313


To create a new site with hugo run
```
docker run --name hugo -it -p 1313:1313 -v $(pwd):/src/ --rm localhost/hugo hugo new site
```

To test your local changes just run
```
docker run --name hugo -it -p 1313:1313 -v $(pwd):/src/ --rm localhost/hugo hugo server <your arguments>
```
