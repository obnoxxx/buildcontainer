SHELL := /usr/bin/env bash

IMAGE_REGISTRY ?= quay.io
REGISTRY_NAMESPACE ?= fillme

IMAGE_TAG ?= latest
IMAGE_OS ?= fedora
IMAGE_LANG ?= c
IMAGE_NAME ?= devcontainer/$(IMAGE_OS)-$(IMAGE_LANG)

IMG  ?= $(IMAGE_REGISTRY)/$(REGISTRY_NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG)

# detect whether to use docker or podman as container command.
ifeq ($(origin CONTAINER_CMD),undefined)
# try podman first
CONTAINER_CMD=$(shell podman version >/dev/null 2>&1 && echo podman)
ifeq ($(CONTAINER_CMD),)
#try docker if podman is not available
CONTAINER_CMD=$(shell docker version >/dev/null 2>&1 && echo docker)
endif
endif


.PHONY: image-build
image-build:
	$(CONTAINER_CMD) build . -t $(IMG) -f Containerfile.$(IMAGE_OS) --build-arg INSTALL_SCRIPT=install-packages_$(IMAGE_OS)_$(IMAGE_LANG).sh


.PHONY: image-push
image-push:
	$(CONTAINER_CMD) push $(IMG) 



