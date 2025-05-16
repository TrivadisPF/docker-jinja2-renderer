FROM python:3.8.0-alpine3.10

# upgrade pip
RUN python3 -m pip install --upgrade pip

# ================ Jinja2 =========================== #
# Create folders
RUN mkdir /templates/
RUN mkdir /variables/

# Set needed env vars
ENV SCRIPTS_DIR /scripts
ENV TEMPLATES_DIR /templates
ENV VERSION=v4.2.0
ENV BINARY=yq_linux_amd64

RUN pip3 install "jinja2<3.1" jinja2-cli[yaml,toml,xml]==0.7.0

RUN wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}.tar.gz -O - | \
  	tar xz && mv ${BINARY} /usr/local/bin/yq

# we assume that the output volume is mapped to /opt/analytics-generator/stacks
CMD /scripts/generate.sh
