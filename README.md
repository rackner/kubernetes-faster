# kubernetes-faster

Example repository with configuration for a Kubernetes cluster on AWS GovCloud. Certificates and PKI information are removed.

### This repo does not use EKS, AKS, or any managed Kubernetes tooling. It is meant for getting Kubernetes up and running quickly on nontypical cloud environments like AWS GovCloud or Azure Government where these managed services may not exist.

# Folders

## Kops - Cluster Set Up

This folder contains the artifacts for a Kops-run cluster on AWS GovCloud. Kops is used to bootstrap the cluster as well as spin up the actual infrastructure on AWS EC2 in GovCloud. Kops is also used to perform operational tasks like node rotations and upgrades.

## Starter Applications - Starting cluster applications & tooling

This folder contains forked helm charts (and in some cases, plain Kubernetes YAML files) for a variety of applications which run on our default clusters. We run several types of applications, all of which are peripheral in nature. We've included a brief sentence about the components here, but for a full explanation check the documentation in the /helm folder.  In the future, as more packages support Kustomize, that may alternately be used instead.

Assuming the installation of all starter-applications, the stack diagram for our Nodes and Pods looks like this:

![Stack Diagram](https://github.com/rackner/kubernetes-faster/StackDiagram.jpg)

What follows is a list of the applications in our starter application set. There is a MUCH more in depth explanation of the applications that were chosen (and why they were chosen) in the readme inside the starter-applications folder.

### Service Mesh

Istio - Service Mesh

### Serverless

Knative - Serverless Platform built on Kubernetes

### Security

Anchore Engine - Open Source Container Scanning

Falco - Kubernetes Runtime Security to check for outlier application behavior

Open Policy Agent - An open source policy engine used as a Kubernetes Admission Controller

SonarQube - Code Quality and Security scanning

### CI/CD

Jenkins - Jenkins master and agent cluster on Kubernetes using Helm

FluxCD - Kubernetes-native GitOps CD with polling mechanism

The CI/CD Pipeline we're using looks like this: ![CI/CD Pipeline](https://github.com/rackner/kubernetes-faster/DevOpsPipeline.jpg)

### Metrics & Monitoring

Prometheus + Grafana - Kubernetes centralized metrics and monitoring dashboard

### Logging

ELK Stack
ElasticSearch - Industry-standard search stack
LogStash - Log Forwarder
Kibana - Log Visualizer and Search/Filtering Dashboard

## Releases

This folder contains "Releases" which are CRDs that will get created in the cluster that define where FluxCD looks for during its control loop for our GitOps CI/CD.

## Applications

This folder contains an example application that runs and deploys via the Flux CI/CD operator
