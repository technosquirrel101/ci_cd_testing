# CI / CD testing for EVerest

## current state

The current setup consists of the following steps:

1. upon a push to the repository, a github action is called that starts docker-compose
2. docker-compose loads an environment consisting of:
    - an MQTT server
    - an OCPP 1.6 backend (consisting of a mariadb instance and a SteVe instance)
    - a Node Red server
    - a fresh debian-based container to run the tests in
3. the test-container gets built and updated to the required set of packages
4. an entrypoint script gets run in the container to configure, checkout and build everest-core and finally the new everest-core is being run

## next steps

Next in line to create a fully automatic CI/CD testing pipeline would be to:
- create an image of the testing-container
- modify the ocpp-compliance-testing-tool to include a basic everest-core controller
- add test functions for everest-core testing to the ocpp-compliance-testing-tool (which should at that point be renamed EVerest-testing-tool)
- execute a set of test functions on the newly built everest-core

## further analysis

Since this project aims to obtain further data like test-coverage, tested functions/modules, other/outside environment conditions of everest-core, the final steps would be:
- running analysis with something like "gcov" to analyse/scan executed functionality via debugging symbols at runtime
- obtain data from surrounding environment (package versions, MQTT server parameters/log, syslog output, etc.)