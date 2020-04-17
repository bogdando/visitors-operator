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
export GO111MODULE=on
go mod init
operator-sdk build visitors-operator:0.1 #REPLACE_IMAGE in
deploy/operator.yaml
kubectl apply -f deploy/crds/*_crd.yaml
kubectl apply -f deploy/service_account.yaml
kubectl apply -f deploy/role.yaml
kubectl apply -f deploy/role_binding.yaml
kubectl apply -f deploy/operator.yaml
```
