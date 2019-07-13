#
# Makefile
#

DOCKROPTION := run --rm -it
ENVFILE := ./molecule/default/.env
MOUNT1 := "${PWD}":/tmp/$(basename "${PWD}"):ro
MOUNT2 := /var/run/docker.sock:/var/run/docker.sock
WORKDIR := /tmp/$(basename "${PWD}")
ENVFILE := ./molecule/default/.env
DOCKERIMAGE := quay.io/ansible/molecule:2.20
MOLECULE := docker $(DOCKROPTION) --env-file ${PWD}/molecule/default/.env -v $(MOUNT1) -v $(MOUNT2) -w $(WORKDIR) $(DOCKERIMAGE) molecule

test:
	@$(MOLECULE) $(DEBUG) test

converge:
	@$(MOLECULE) $(DEBUG) converge

echo:
	echo $(MOLECULE) $(DEBUG)
