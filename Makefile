
SHELL := /usr/bin/env bash
ROOT := ${CURDIR}

.PHONY: create
create:
	$(ROOT)/create.sh
.PHONY: delete
teardown:
	$(ROOT)/teardown.sh

.PHONY: validate
validate:
	${ROOT}/validate.sh

lint: check_shell check_shebangs check_python check_golang check_terraform check_docker check_base_files check_headers check_trailing_whitespace

.PHONY: check_shell
check_shell:
	@source test/make.sh && check_shell

.PHONY: ci
ci: verify-header

.PHONY: verify-header
verify-header:
	python test/verify_boilerplate.py
	@echo "\n Test passed - Verified all file Apache 2 headers"

.PHONY: setup-project
setup-project:
	# Enables the Google Cloud APIs needed
	./enable-apis.sh
	# Runs the generate-tfvars.sh
	./generate-tfvars.sh

.PHONY: tf-apply
tf-apply:
	# Downloads the terraform providers and applies the configuration
	cd terraform && terraform init -upgrade && terraform apply

.PHONY: tf-destroy
tf-destroy:
	# Downloads the terraform providers and applies the configuration
	cd terraform && terraform destroy


.PHONY: clean-up
clean-up:
	./remove_manifests.sh

.PHONY: check_python
check_python:
	@source test/make.sh && check_python

.PHONY: check_golang
check_golang:
	@source test/make.sh && golang

.PHONY: check_terraform
check_terraform:
	@source test/make.sh && check_terraform

.PHONY: check_docker
check_docker:
	@source test/make.sh && docker

.PHONY: check_base_files
check_base_files:
	@source test/make.sh && basefiles

.PHONY: check_shebangs
check_shebangs:
	@source test/make.sh && check_bash

.PHONY: check_trailing_whitespace
check_trailing_whitespace:
	@source test/make.sh && check_trailing_whitespace

.PHONY: check_headers
check_headers:
	@echo "Checking file headers"
	@python3.7 test/verify_boilerplate.py
