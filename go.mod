module visitors-operator

go 1.13

require (
	github.com/golang/protobuf v1.4.0 // indirect
	github.com/operator-framework/operator-sdk v0.17.1-0.20200416203822-1087d81ff40b
	github.com/spf13/pflag v1.0.5
	golang.org/x/net v0.0.0-20200324143707-d3edc9973b7e // indirect
	k8s.io/api v0.18.2
	k8s.io/apimachinery v0.18.2
	k8s.io/client-go v12.0.0+incompatible
	sigs.k8s.io/controller-runtime v0.6.0
)

replace (
	github.com/Azure/go-autorest => github.com/Azure/go-autorest v13.3.2+incompatible // Required by OLM
	k8s.io/client-go => k8s.io/client-go v0.17.4 // Required by prometheus-operator
)
