FROM sameersbn/gitlab-ci-runner:latest
MAINTAINER Jerome Jiang "jeromefromcn@gmail.com"

RUN apt-get update && \
    sudo apt-get install -y software-properties-common && \
    sudo add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
    sudo apt-get install -y oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* # 20150613

ADD assets/ /app/
RUN chmod 755 /app/setup/install
RUN /app/setup/install
