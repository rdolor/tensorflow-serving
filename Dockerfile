FROM tensorflow/serving:1.14.0-rc0 
ADD /activateServer /activateServer
RUN apt-get update -qq && apt-get install -yqq --no-install-recommends vim
WORKDIR "/"
