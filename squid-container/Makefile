all: $(patsubst %.Dockerfile,build-stamp_%,$(wildcard *.Dockerfile))

build-stamp_%: %.Dockerfile
	podman build -t squid-img -f $< .
	mkdir /etc/squid
	cp squid.conf /etc/squid
	cp squid.service /etc/systemd/system/
	podman create -dt -v /etc/squid/squid.conf:/etc/squid/squid.conf:Z -p 3128:3128 --name squid-cont squid-img
	touch $@

push-stamp_%: build-stamp_%
	podman push squid-img
	touch $@

push_all: $(patsubst %.Dockerfile,push-stamp_%,$(wildcard *.Dockerfile))
