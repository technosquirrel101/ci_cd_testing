FROM debian:11.0

ENV PORT 80

RUN apt update && apt upgrade -y

RUN apt install -y python3-pip git rsync wget cmake doxygen graphviz build-essential clang-tidy cppcheck maven openjdk-11-jdk npm docker docker-compose libboost-all-dev nodejs libssl-dev libsqlite3-dev clang-format curl rfkill

RUN python3 -m pip install --upgrade pip setuptools wheel jstyleson jsonschema

WORKDIR /checkout

RUN /bin/bash -c 'echo "export PATH=$PATH:/root/.local/bin" >> /root/.bashrc'

RUN /bin/bash -c 'echo "export CPM_SOURCE_CACHE=/.cache/CPM" >> /root/.bashrc'

# until here there solely default installation configuration, next is deployment-specific

COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

# CMD [ "/bin/bash" ]

# CMD [ "/entrypoint.sh" ]

# CMD [ "/bin/bash", "-c", "ping 172.33.1.41" ]