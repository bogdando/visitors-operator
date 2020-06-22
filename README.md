# Create from scratch
```
operator-sdk new visitors-operator
operator-sdk add api --api-version=example.com/v1 --kind=VisitorsApp
# update _types.go to match future CRDs , add +k8s:openapi-gen=true , x3
# update cr/crds' properties,
# https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
operator-sdk generate crds
operator-sdk generate k8s 
operator-sdk add controller --api-version=example.com/v1 --kind=VisitorsApp
```

# Build and run locally
```
kind create cluster --image kindest/node:latest
kubectl config set-context --current --namespace=operators-playground

# export GOFLAGS=-mod=vendor
# go mod vendor

export OPERATOR_NAME=visitorsapp
go build ./...
kubectl apply -f deploy/namespace.yaml
kubectl apply -f deploy/crds/*_crd.yaml
operator-sdk build docker.io/bogdando/visitors-operator:0.2
operator-sdk run local --watch-namespace operators-playground --verbose
#... (watches for events in foreground) ...

kubectl apply -f deploy/crds/*_cr.yaml
```

# Deploy as usual
```
kubectl apply -f deploy/crds/*_crd.yaml
kubectl apply -f deploy/service_account.yaml
kubectl apply -f deploy/role.yaml
kubectl apply -f deploy/role_binding.yaml
kubectl apply -f deploy/operator.yaml

kubectl apply -f deploy/crds/*_cr.yaml


kubectl delete -f deploy/crds/*_cr.yaml
kubectl delete crd visitorsapps.example.com
kubectl delete -f deploy/service_account.yaml
kubectl delete -f deploy/role.yaml
kubectl delete -f deploy/role_binding.yaml
kubectl delete -f deploy/operator.yaml
```
