all: image

publish: image
	docker push neowaylabs/klbdeps

image:
	docker build . -t neowaylabs/klbdeps

shell: image
	docker run -ti neowaylabs/klbdeps /bin/bash
