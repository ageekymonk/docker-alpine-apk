SHELL := /bin/bash
WORKING_DIR := $(shell pwd)

DOLLAR := $$
export DOLLAR

ifdef VERBOSE
	Q =
else
	Q = @
endif

IMAGE_NAME := ramz/alpine-apk
IMAGE_VERSION := latest
IMAGE_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)

.PHONY: build release print-dockerfile

build: ## Build docker container and tag it
	docker build -t $(IMAGE_TAG) $(WORKING_DIR)

# Custom Help Message with self Documenting Targets
define USAGE_DOC
Usage: make TARGET ... [VAR1=VALUE]...

Available targets:
endef
export USAGE_DOC

help:
	${Q}echo "$$USAGE_DOC"
	${Q}awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)
