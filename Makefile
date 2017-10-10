# FreshTracks specific build

build: ## Build the uber jar
	sbt assembly

image: build ## Build the docker image
	docker build -t eventism:latest .

tag: image ## Tag the docker image
	docker tag eventsim:latest quay.io/stsatlas/ftio-eventsim:latest

push: tag ## Push the image to Quay.io
	docker push quay.io/stsatlas/ftio-eventsim:latest

help:
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF}' $(MAKEFILE_LIST)

.DEFAULT_GOAL=help
.PHONY=help

