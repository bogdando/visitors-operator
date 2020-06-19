module github.com/bogdando/visitors-operator

go 1.13

require (
	github.com/bogdando/visitors-operator v1.0.0
	github.com/go-openapi/spec v0.19.3
	github.com/golang/protobuf v1.4.0 // indirect
	github.com/operator-framework/operator-sdk v0.18.1
	github.com/spf13/pflag v1.0.5
	golang.org/x/net v0.0.0-20200324143707-d3edc9973b7e // indirect
	k8s.io/api v0.18.2
	k8s.io/apimachinery v0.18.2
	k8s.io/client-go v12.0.0+incompatible
	k8s.io/kube-openapi v0.0.0-20200121204235-bf4fb3bd569c
	sigs.k8s.io/controller-runtime v0.6.0
)

replace (
	github.com/Azure/go-autorest => github.com/Azure/go-autorest v13.3.2+incompatible // Required by OLM
	k8s.io/client-go => k8s.io/client-go v0.18.2 // Required by prometheus-operator
)
