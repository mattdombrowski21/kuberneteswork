all: $(patsubst %.Dockerfile,build-stamp_%,$(wildcard *.Dockerfile))

build-stamp_%: %.Dockerfile
	podman build -t tftp-img -f $< .
	mkdir /var/lib/tftpboot
	cp tftp.service /etc/systemd/system/
	podman create -dt -v /var/lib/tftpboot:/var/lib/tftpboot:Z -p 69:69/udp --name tftp-cont tftp-img 
	touch $@

push-stamp_%: build-stamp_%
	podman push tftp-img
	touch $@

push_all: $(patsubst %.Dockerfile,push-stamp_%,$(wildcard *.Dockerfile))
