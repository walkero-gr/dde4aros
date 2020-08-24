
REPO ?= walkero/dde4aros
TAG ?= latest

.PHONY: build buildnc push release

default: build

build:
	docker build -t $(REPO):$(TAG) .

buildnc:
	docker build --no-cache -t $(REPO):$(TAG) .

push:
	docker push $(REPO):$(TAG)

release: build push
