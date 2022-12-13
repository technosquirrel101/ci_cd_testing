#!/bin/bash

mkdir -p /checkout/

export PATH=$PATH:/root/.local/bin
export CPM_SOURCE_CACHE=/.cache/CPM
export MQTT_SERVER_ADDRESS=mqtt-server

git clone https://github.com/EVerest/everest-dev-environment.git

cd /checkout/everest-dev-environment/dependency_manager

python3 -m pip install .

edm --config ../everest-complete-readonly.yaml --workspace /checkout/everest-workspace

cd /checkout/everest-workspace/everest-utils/ev-dev-tools

python3 -m pip install .

mkdir -p /checkout/everest-workspace/everest-core/build

cd /checkout/everest-workspace/everest-core/build

cmake -j$(nproc) ..

make -j$(nproc) install

cd /checkout/everest-workspace/everest-core/build/run-scripts/

# ping mqtt-server -c 4

# nmap -sT -p 1883 172.33.1.41 -Pn

./run-sil.sh