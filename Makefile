#
# Makefile
#

DOCKROPTION := run --rm -it
ENVFILE := ${PWD}/molecule/shared/.env.yml
CONFIG := ${PWD}/molecule/docker/molecule.yml
MOUNT1 := "${PWD}":/tmp/$(basename "${PWD}"):ro
MOUNT2 := /var/run/docker.sock:/var/run/docker.sock
WORKDIR := /tmp/$(basename "${PWD}")
DOCKERIMAGE := quay.io/ansible/molecule:2.20
MOLECULE := docker $(DOCKROPTION) -v $(MOUNT1) -v $(MOUNT2) -w $(WORKDIR) $(DOCKERIMAGE) molecule --base-config $(CONFIG) --env-file $(ENVFILE)
DEBUG := --no-debug

test:
	@$(MOLECULE) $(DEBUG) test --scenario-name docker

create:
	@$(MOLECULE) $(DEBUG) create --scenario-name docker

converge:
	@$(MOLECULE) $(DEBUG) converge --scenario-name docker
