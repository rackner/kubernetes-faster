# Releases

This folder contains an example Release YAML which is used by FluxCD running on the cluster to decide which application helm charts to monitor and update on a change.

These "releases" are CustomResourceDefinitions of type Release - once created on the server, FluxCD will use them to inform its automatic deployment and updating processes based on the specs.