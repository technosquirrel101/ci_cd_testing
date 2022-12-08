FROM debian:11.0

ENV PORT 80

RUN apt update && apt upgrade -y

RUN apt install -y python3-pip git rsync wget cmake doxygen graphviz build-essential clang-tidy cppcheck maven openjdk-11-jdk npm docker docker-compose libboost-all-dev nodejs libssl-dev libsqlite3-dev clang-format curl rfkill

RUN python3 -m pip install --upgrade pip setuptools wheel jstyleson jsonschema

WORKDIR /checkout

RUN /bin/bash -c 'echo "export PATH=$PATH:/root/.local/bin" >> /root/.bashrc'

RUN /bin/bash -c 'echo "export CPM_SOURCE_CACHE=/.cache/CPM" >> /root/.bashrc'

# until here there solely default installation configuration, next is deployment-specific

COPY ./entrypoint.sh /checkout/

CMD [ "/bin/bash" ]

# RUN git clone https://github.com/EVerest/everest-dev-environment.git

# WORKDIR /checkout/everest-dev-environment/dependency_manager

# RUN python3 -m pip install .

# RUN edm --config ../everest-complete-readonly.yaml --workspace /checkout/everest-workspace

# WORKDIR /checkout/everest-workspace/everest-utils/ev-dev-tools

# RUN python3 -m pip install .

# RUN mkdir -p /checkout/everest-workspace/everest-core/build

# WORKDIR /checkout/everest-workspace/everest-core/build

# RUN cmake ..

# RUN make

# CMD [ "/checkout/everest-workspace/everest-core/build/run-scripts/run-sil.sh" ]