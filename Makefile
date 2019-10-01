-include env_make

REPO ?= walkero/dde4aros
TAG ?= 1.0

.PHONY: build buildnc push release

default: build

build:
	docker build -t $(REPO):$(TAG) .
	docker build -t $(REPO):latest .

buildnc:
	docker build --no-cache -t $(REPO):$(TAG) .
	docker build --no-cache -t $(REPO):latest .

push:
	docker push $(REPO):$(TAG)

release: build push
