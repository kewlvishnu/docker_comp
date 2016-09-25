## BUILDING
##   (from project root directory)
##   $ docker build -t php-for-kewlvishnu-docker_comp .
##
## RUNNING
##   $ docker run -p 9000:9000 php-for-kewlvishnu-docker_comp
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="s71mu4r" \
    STACKSMITH_STACK_NAME="PHP for kewlvishnu/docker_comp" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-7.0.11-1 --checksum cc9129523269e86728eb81ac489c65996214f22c6447bbff4c2306ec4be3c871

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# PHP base template
COPY . /app
WORKDIR /app

CMD ["php", "-a"]
