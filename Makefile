build-riders-image:
	docker build -f ./infra/docker/riders.Dockerfile -t riders-api-image:1.0.0 .

build-users-image:
	docker build -f ./infra/docker/users.Dockerfile -t users-api-image:1.0.0 .

setup-deployments:
	kubectl apply -f ./infra/k8s/deployment.yaml

setup-service:
	kubectl apply -f ./infra/k8s/service.yaml

setup-ingress:
	kubectl apply -f ./infra/k8s/ingress.yaml

remove-deployments:
	kubectl delete deployment --all

remove-services:
	kubectl delete service --all

remove-ingress:
	kubectl delete ingress --all