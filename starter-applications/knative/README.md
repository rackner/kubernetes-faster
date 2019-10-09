# Knative Installation

This folder contains all Knative components - Monitoring, Serving, and Eventing

The Knative installation is performed in 2 steps. First install the Custom Resource Definitions:

```
   kubectl apply --selector knative.dev/crd-install=true \
   --filename ./serving.yaml \
   --filename ./release.yaml \
   --filename ./monitoring.yaml
```

Then install the rest of the components:

```
   kubectl apply --filename ./serving.yaml \
   --filename ./release.yaml \
   --filename ./monitoring.yaml
```
