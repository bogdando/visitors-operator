```
operator-sdk new visitors-operator
operator-sdk add api --api-version=example.com/v1 --kind=VisitorsApp
# update _types.go to match future CRDs , add +k8s:openapi-gen=true , x3
# update cr/crds' properties,
# https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
operator-sdk generate crds
operator-sdk generate k8s 
operator-sdk add controller --api-version=example.com/v1 --kind=VisitorsApp

...
GOFLAGS=-mod=vendor go mod vendor
GOFLAGS=-mod=vendor go build ./...
export OPERATOR_NAME=visitorsapp
kubectl apply -f deploy/crds/*_crd.yaml
operator-sdk run local --watch-namespace default --verbose

...
kubectl apply -f deploy/namespace.yaml
kubectl config set-context --current --namespace=operators-playground

export GO111MODULE=on
go mod init
operator-sdk build docker.io/bogdando/visitors-operator:0.1 #REPLACE_IMAGE in deploy/operator.yaml
kubectl apply -f deploy/crds/*_crd.yaml
kubectl apply -f deploy/service_account.yaml
kubectl apply -f deploy/role.yaml
kubectl apply -f deploy/role_binding.yaml
kubectl apply -f deploy/operator.yaml
```
