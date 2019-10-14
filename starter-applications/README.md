# Starter Applications

This folder contains Helm Charts and in some cases, plain Kubernetes YAML files. for all the various default components that we run on our cluster.

To install an application from this folder onto our cluster, we run

```
helm upgrade --install /path/to/app/folder
```

A full breakdown and explanation of the components is below.


## Falco

Falco is an open source project which provides intrusion detection using Linux Kernel instrumentation.  The implementation of Falco in the /falco folder contains base best practice rules for a host of possible applications, many of which are already installed on this cluster (e.g. the ELK stack).

In our Falco config, we've enabled the SNS topic notification (which is mirrored in the Kops config).  We have also included installation code for the Falco Kubernetes Response Engine, which runs on Kubeless (an alternative FaaS implementation for Kubernetes) to automatically shut down pods which fail the Falco monitoring check.

Falco is chosen because it is highly flexible in how it can be configured, for instance for specific compliance standards - and also highly flexible in how it can respond to threats through use of SNS Topics or NATS. 

## Istio

Istio is a popular Service Mesh implementation which provides advanced networking and service discovery functionality and is often used with Kubernetes.  The Istio folder contains a forked Readme for installing Istio which occurs in 2 parts - first the installation of the 23 CRDs which Istio requires, then the installation of Istio itself.  We are using the default configuration with automatic sidecar injection.

This also includes installation of Kiali, a UI which provides observability for Istio.

The Service Mesh pattern is chosen for its specific help in managing large microservice environments - if the intended use case is simpler architecturally, with only a few services or applications - we would omit the use of Istio to save the complexity and overhead of the proxy.

## Knative

Knative is an implementation of the Serverless pattern on Kubernetes.  It allows for no touch scaling up and down (to zero) for container workloads based on an events based model, similar to AWS Lambda.  Knative works with Istio as its backbone.

Knative is currently the fastest growing FaaS implemention on Kubernetes, competing with older implementations like Kubeless as well as several newer options.  We choose it for its community and level of support.

## Anchore Engine

Anchore Engine is an Open Source container scanning and policy evaluation tool.  It is used as part of the CI/CD pipeline.

Anchore Engine is used to keep this stack completely open source.  Depending on the client and use case, this may not necessarily be the best choice, and security is a place where it is worth paying for a superior solution, since paid solutions may bne quicker to respond to CVE releases.

## Jenkins

The Jenkins folder contains helm charts for deploying a master and agent Jenkins cluster on Kubernetes

Jenkins is chosen as the CI/CD platform of choice for its significant community and plugin ecosystem. Jenkins can be run on the cluster itself, as in this example - often on a different "utility" cluster, instead of the same cluster as production applications.

## SonarQube

SonarQube is used in the pre-container pipeline for code quality and security scanning across dozens of programming languages. We run the platform on Kubernetes using the attached helm chart.  It makes use of a Persistent Volume and Persistent Volume Claim for storage.

SonarQube is the de-facto option for open source code quality scanning on many different programming languages.  Similarly to Jenkins (and because it would be used as part of the Jenkins pipeline) we could run this on the "utility" cluster or otherwise separately from the main app cluster - especially for production.

## Elastic Stack

The Elastic Stack folder includes helm charts for installing Elastic Stack configured with Elastic Search (of course) Logstash and Kibana.  Alternately, it includes installation yaml for Fluent Bit or FluentD in lieu of Logstash.

We use Elastic Stack because it is an excellent default choice for log collection and search - and Kibana is a great OSS UI for such.  Between Logstash, Fluent Bit, and FluentD as log collector/forwarders, the choice often depends on the use case.  Fluent Bit for instance, is much more lightweight than either Logstash or FluentD.  We use Logstash as the default but if a cluster is running tens or hundreds of small microservices, Fluent Bit would be the obvious alternative.

## Prometheus + Grafana

Prometheus and Grafana are popular and well supported metrics collection and visualization tools, respectively.  We use the Prometheus operator to run prometheus on our clusters in a way that can scale up.  By default, this provides centralized metric collection from all nodes, pods - anything that is accessible via extended metrics from the kubelet.  Additionally in this configuration we would extend this pattern to include additional metrics from Istio and Knative, but custom application metrics can also be included.

## Open Policy Agent

Open Policy Agent is an open source policy engine, in this case deployed as a Kubernetes Admission Controller
to allow for request interception when accessing the Kubernetes API.  The Admission Controller will check the request against the policy engine ruleset to ensure that bad actors with access to the Kubernetes API cannot run rampant.