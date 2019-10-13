# Kops

Contained in this folder is an example Kops cluster config for AWS GovCloud. All kubeconfig and certificate/pki information has been removed.

Additionally, we are using Calico as the chosen CNI (Container Network Interface) since multicast is not needed in this particular setup, or for the applications intended to be run.  If multicast was necessary (and/or encryption over the wire) we would switch to weave.

Here is a description of the Cluster Specifications.

Infrastructure Location: AWS GovCloud
Availability Zones: US-Gov-West-1a, US-Gov-West-1b and US-Gov-West-1c
Master (Control Plane) Nodes: Min 6 (2 in each AZ). Max 12 (4 in each AZ)
Worker Nodes: Min 20, Max 40


