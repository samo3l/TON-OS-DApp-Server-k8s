# kubernetes_install

Important default variables:

calico.interface: main network interface name (it's necessary in case of multiple interfaces on the node to ensure that calico will use right one)

control_plane_endpoint: very important variable - endpoint for control plane. If playbook will setup singe-master cluster - need to specify just IP of master node. In case of HA cluster installation endpoint must point to HA proxy server or load balancer witch points to all master nodes in its turn. 

kubernetes:
  version: 1.16.4 # choose version you want to install
  serviceSubnet: 10.96.0.0/12 
  podSubnet: 192.168.0.0/16


This playbooks are using ansible hosts groups. At least one of them need to be specified. (if not playbook will do only preparation steps)


Host groups:

```
"[kube-master]"

hostname1 (required if master will be installed)

hostname2 (optional)

hostname3 (optional)
```

If multiple hosts specified - playbook will install stacked HA infrastructure

```
"[kube-nodes]

hostname1

hostname2

hostname3

```
hostnames in this groups will be added to cluster. There are two cases:

Create cluster and add nodes into the cluster (if hosts in kube-master group defined)
Add nodes into existed cluster (if there are no hosts in kube-master group). In this case you will need specify two additional variables "kubeadm_token" and "ca_cert_hash" before start execution.

Highly recommended to use hostnames instead of IPs in inventory file!
