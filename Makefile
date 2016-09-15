REPO=docker-dev.hli.io/ccm/luigi-mesos-test
TAG=0.0.2

run-local:
	python -m luigi --module apps.luigi_test_pipe RootTaskTest --local-scheduler --n 1 --workers=1

shell:
	docker run --rm -ti \
		-v `pwd`:/opt/muigi \
		--net=host \
		$(REPO):$(TAG) \
		bash || true

luigid:
	luigid

docker-build:
	docker build -t $(REPO):$(TAG) .

docker-push:
	docker push $(REPO):$(TAG)

