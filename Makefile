all: image

image:
	docker build . -t neowaylabs/klbdeps

shell: image
	docker run -ti neowaylabs/klbdeps /bin/bash
