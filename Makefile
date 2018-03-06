.PHONY: pdf

all: docker pdf zip

clean:
	rm -rf out
	rm CarsonAnderson-DynamicKubernetes.zip

extract-processed-html:
	docker rm -f dynamic-kubernetes || true
	docker create --name=dynamic-kubernetes carsonoid/dynamic-kubernetes
	rm -rf out || true
	mkdir out
	docker cp  dynamic-kubernetes:/srv/ out
	mv out/srv/* out/.
	rmdir out/srv
	rm out/index.html

zip: extract-processed-html
	zip CarsonAnderson-DynamicKubernetes.zip \
	out/QoS* \
	out/pdf/*

docker:
	docker build -t carsonoid/dynamic-kubernetes .

pdf:
	./utils/to-pdf.sh
