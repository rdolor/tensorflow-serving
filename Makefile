IMAGE_NAME=tensorflow_serving:master

build ::
	echo ${IMAGE_NAME}
	docker build -f ./Dockerfile -t ${IMAGE_NAME} .
	#docker push ${IMAGE_NAME}
