FROM ubuntu:latest
RUN apt-get update ; apt-get -y install git
ADD ./gitsync.sh /bin/gitsync.sh
RUN chmod 777 /bin/gitsync.sh
ENTRYPOINT /bin/gitsync.sh
