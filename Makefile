#
# Makefile
#

# Makefile の変数の宣言メモ
# = は､使われる際に代入される
# =: は､即時代入される

# SCEARIONAME が空ではない場合は､ true
ifdef SCEARIONAME
	# SCEARIONAME が空ではない場合は､ vagrant で実行
	SCEARIONAME := vagrant
else
	# SCEARIONAME 空の場合(default)の場合は､false
	# SCEARIONAME が空の場合は､ Docker で実行
	DOCKROPTION := run --rm -it
	MOUNT1 := "${PWD}":/tmp/$(basename "${PWD}"):ro
	MOUNT2 := /var/run/docker.sock:/var/run/docker.sock
	WORKDIR := /tmp/$(basename "${PWD}")
	DOCKERIMAGE := quay.io/ansible/molecule:2.20.2
	DOCKERCMD := docker $(DOCKROPTION) -v $(MOUNT1) -v $(MOUNT2) -w $(WORKDIR) $(DOCKERIMAGE)
	SCEARIONAME := docker
endif

# debugモードを on にしたい場合は､引数に下記を追加する
# DEBUG=--debug
DEBUG := --no-debug
ENVFILE := ./molecule/shared/.env.yml
CONFIG := ./molecule/$(SCEARIONAME)/molecule.yml
# 即代入だと､$MOLECULESUBCMD が未定義なのでエラーになる
MOLECULECMD = molecule --base-config $(CONFIG) --env-file $(ENVFILE) $(DEBUG) $(MOLECULESUBCMD) --scenario-name $(SCEARIONAME)

test:
	@$(eval MOLECULESUBCMD := test)
	@$(DOCKERCMD) $(MOLECULECMD)

lint:
	@$(eval MOLECULESUBCMD := lint)
	@$(DOCKERCMD) $(MOLECULECMD)

cleanup:
	@$(eval MOLECULESUBCMD := cleanup)
	@$(DOCKERCMD) $(MOLECULECMD)

destroy:
	@$(eval MOLECULESUBCMD := destroy)
	@$(DOCKERCMD) $(MOLECULECMD)

dependency:
	@$(eval MOLECULESUBCMD := dependency)
	@$(DOCKERCMD) $(MOLECULECMD)

create:
	@$(eval MOLECULESUBCMD := create)
	@$(DOCKERCMD) $(MOLECULECMD)

converge:
	@$(eval MOLECULESUBCMD := converge)
	@$(DOCKERCMD) $(MOLECULECMD)

verify:
	@$(eval MOLECULESUBCMD := verify)
	@$(DOCKERCMD) $(MOLECULECMD)
