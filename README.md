# kubernetes-faster

Example repository with configuration for a Kubernetes cluster on AWS GovCloud. Certificates and PKI information are removed.

### This repo does not use EKS, AKS, or any managed Kubernetes tooling. It is meant for getting Kubernetes up and running quickly on nontypical cloud environments like AWS GovCloud or Azure Government where these managed services may not exist.

# Folders

## Kops - Cluster Set Up

This folder contains the artifacts for a Kops-run cluster on AWS GovCloud. Kops is used to bootstrap the cluster as well as spin up the actual infrastructure on AWS EC2 in GovCloud. Kops is also used to perform operational tasks like node rotations and upgrades.

## Starter - Starting cluster applications & tooling

This folder contains helm charts (and in some cases, plain Kubernetes YAML files) for a variety of applications which run on our default clusters. We run several types of applications, all of which are peripheral in nature. We've included a brief sentence about the components here, but for a full explanation check the documentation in the /helm folder.  In the future, as more packages support Kustomize, that may alternately be used instead.

### Service Mesh

Istio - Service Mesh

### Serverless

Knative - Serverless Platform built on Kubernetes

### Container Scanning

Anchore Engine - Open Source Container Scanning

### CI/CD

Jenkins X - Kubernetes-native Jenkins (including SonarType Nexus)

Tekton Pipelines - Born out of Knative pipelines, uses CRDs to specify CI/CD pipelines

FluxCD - Kubernetes-native GitOps CD with polling mechanism

### Code Quality

SonarQube - Code Quality and Security scanning

### Metrics & Monitoring

Prometheus + Grafana - Kubernetes centralized metrics and monitoring dashboard

### Logging

ELK Stack

ElasticSearch - Industry-standard search stack
Kibana - Log Visualizer and Search/Filtering Dashboard

## Applications

This folder contains an example application that runs and deploys via the Flux CI/CD operator
