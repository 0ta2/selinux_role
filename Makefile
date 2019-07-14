#
# Makefile
#

DRIVER := docker
DOCKROPTION := run --rm -it
ENVFILE := ${PWD}/molecule/*/.env
CONFIG := ${PWD}/molecule/$(DRIVER)/molecule.yml
MOUNT1 := "${PWD}":/tmp/$(basename "${PWD}"):ro
MOUNT2 := /var/run/docker.sock:/var/run/docker.sock
WORKDIR := /tmp/$(basename "${PWD}")
DOCKERIMAGE := quay.io/ansible/molecule:2.20
MOLECULE := docker $(DOCKROPTION) --env-file $(ENVFILE) -v $(MOUNT1) -v $(MOUNT2) -w $(WORKDIR) $(DOCKERIMAGE) molecule --base-config $(CONFIG)
DEBUG := --no-debug

test:
	@$(MOLECULE) $(DEBUG) test --scenario-name $(DRIVER)

create:
	@$(MOLECULE) $(DEBUG) create --scenario-name $(DRIVER)

converge:
	@$(MOLECULE) $(DEBUG) converge --scenario-name $(DRIVER)

echo:
	echo $(MOLECULE) $(DEBUG) create --scenario-name $(DRIVER)
