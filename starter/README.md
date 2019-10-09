# Starter

This folder contains Helm Charts and in some cases, plain Kubernetes YAML files. for all the various default components that we run on our cluster.

A full breakdown and explanation of the components is below.

## Istio

Istio is a popular Service Mesh implementation which provides advanced networking and service discovery functionality and is often used with Kubernetes.  The Istio folder contains a forked Readme for installing Istio which occurs in 2 parts - first the installation of the 23 CRDs which Istio requires, then the installation of Istio itself.  We are using the default configuration with automatic sidecar injection.

## Knative

## Anchore Engine

Anchore Engine is an Open Source container scanning and policy evaluation tool.  It is used as part of the CI/CD pipeline.

## SonarQube

SonarQube is used in the pre-container pipeline for code quality and security scanning across dozens of programming languages. We run the platform on Kubernetes using the attached helm chart.  It makes use of a Persistent Volume and Persistent Volume Claim for storage.

## Prometheus + Grafana

Prometheus and Grafana are popular and well supported metrics collection and visualization tools, respectively.  We use the Prometheus operator to run prometheus on our clusters in a way that can scale up.  By default, this provides centralized metric collection from all nodes, pods - anything that is accessible via extended metrics from the kubelet.  Additionally in this configuration we would extend this pattern to include additional metrics from Istio and Knative, but custom application metrics can also be included.