default: help

clean: ## clean build dir
	rm -rf build

build: ## build cli tools
	mkdir build
	cd consumer && go build -o ../build/consumer
	cd producer && go build -o ../build/producer



.PHONY: help

# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'



