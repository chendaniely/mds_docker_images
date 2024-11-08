
.PHONY: build
build_mds:
	DOCKER_BUILDKIT=1 docker buildx build -t --file base/Dockerfile mds_base .

.PHONY: build-clean
build_clean:
	DOCKER_BUILDKIT=1 docker buildx build -t mds_base --file base/Dockerfile --no-cache .


.PHONY: it
it:
	docker run -it -p 8888:8888 -p 8787:8787 -e PASSWORD=password mds_base /bin/bash


.PHONY: run
run_mds:
	docker run -p 8888:8888 -p 8787:8787 -e PASSWORD=password -e DISABLE_AUTH=true --name mds_base mds_base

.PHONY: stop
stop_mds:
	docker stop mds_base
	docker rm mds_base

.PHONY: push
push:
	docker tag mds_base:latest chendaniely/mds_base:latest
	docker push chendaniely/mds_base:latest
