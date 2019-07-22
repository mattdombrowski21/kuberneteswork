all: $(patsubst %.Dockerfile,build-stamp_%,$(wildcard *.Dockerfile))

build-stamp_%: %.Dockerfile
	docker build -t tfplenum/tftp-server:$(*) -f $< . 
	touch $@

push-stamp_%: build-stamp_%
	docker push tfplenum/tftp-server:$(*)
	touch $@

push_all: $(patsubst %.Dockerfile,push-stamp_%,$(wildcard *.Dockerfile))
