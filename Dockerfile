FROM google/cloud-sdk:debian_component_based

RUN apt-get update && apt-get install curl git
RUN gcloud components install beta pubsub-emulator

# Install python/pip
RUN apt-get update \
	&& apt-get install -y python3-pip python3-dev \
	&& cd /usr/local/bin \
	&& ln -s /usr/bin/python3 python \
	&& pip3 --no-cache-dir install --upgrade pip \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/eficode/wait-for/master/wait-for -o /usr/bin/wait-for
RUN chmod +x /usr/bin/wait-for

RUN git clone https://github.com/googleapis/python-pubsub && \
	cd python-pubsub/samples/snippets && \
	pip3 install -r requirements.txt

COPY run.sh /run.sh

EXPOSE 8681

CMD /run.sh
