## BUILDING
##   (from project root directory)
##   $ docker build -t php-for-jazz-man-wp-advanced-search .
##
## RUNNING
##   $ docker run -p 9000:9000 php-for-jazz-man-wp-advanced-search
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="f7w1ggq" \
    STACKSMITH_STACK_NAME="PHP for Jazz-Man/wp-advanced-search" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-7.0.12-1 --checksum d6e73b25677e4beae79c6536b1f7e6d9f23c153d62b586f16e334782a6868eb2

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# PHP base template
COPY . /app
WORKDIR /app

CMD ["php", "-a"]
