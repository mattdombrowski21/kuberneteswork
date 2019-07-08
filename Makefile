all: $(patsubst %.Dockerfile,build-stamp_%,$(wildcard *.Dockerfile))

build-stamp_%: %.Dockerfile
	podman build -t squid -f $< .
	mkdir /volume
	cp squid.conf /volume
	cp squid.service /etc/systemd/system/
	podman create -dt -v /volume:/myVol:z -p 3128:3128 --name squid-cont squid squid -N -f /myVol/squid.conf
	touch $@

push-stamp_%: build-stamp_%
	podman push squid
	touch $@

push_all: $(patsubst %.Dockerfile,push-stamp_%,$(wildcard *.Dockerfile))
