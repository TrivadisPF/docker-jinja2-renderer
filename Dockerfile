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

RUN pip3 install jinja2-cli[yaml,toml,xml]==0.8.1 yq

# we assume that the output volume is mapped to /opt/analytics-generator/stacks
CMD /scripts/generate.sh
