all: help
IMAGE_NAME=gmiretti/cx_oracle

help:
	@echo "Usage:"
	@echo "build        - Build image: ${IMAGE_NAME}"

build:
	docker build -t ${IMAGE_NAME} .

run:
	docker run -it --rm -p 8888:8888 ${IMAGE_NAME}
