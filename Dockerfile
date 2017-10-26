FROM jenkinsci/jnlp-slave
MAINTAINER Jens Neuse <jens.neuse@gmx.de>

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

USER root

RUN apt-get update -y
RUN apt-get install -y jq \
      libapparmor-dev \
      libseccomp-dev
RUN curl https://sdk.cloud.google.com | bash && mv google-cloud-sdk /opt
RUN gcloud components install kubectl