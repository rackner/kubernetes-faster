# kubernetes-faster
Example repository with configuration for a Kubernetes cluster on AWS GovCloud. Certificates are included and not redacted, but the cluster in question is not running anywhere.

### This repo does not use EKS, AKS, or any managed Kubernetes tooling.  It is meant for getting Kubernetes up and running quickly on nontypical cloud environments like AWS GovCloud or Azure Government where these managed services may not exist.

# Folders

## Kops - Cluster Set Up
This folder contains the artifacts for a Kops-run cluster on AWS GovCloud.  Kops is used to bootstrap the cluster as well as spin up the actual infrastructure on AWS EC2 in GovCloud.  Kops is also used to perform operational tasks like node rotations and upgrades.

## Helm - Starting cluster applications & tooling
This folder contains helm charts for a variety of applications which run on our default clusters. We run several types of applications, all of which are peripheral in nature:

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
