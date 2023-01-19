# EKS ~~Anywhere~~ OnMac

_Disclamer! I'm not sure if MacBook is a good place for K8S playgrounds, but I have spare resources on it and have it in a backpack often_

Docker Desktop used as a runtime

```bash
export CLUSTER_NAME=ok-cluster
eksctl anywhere generate clusterconfig $CLUSTER_NAME --provider docker > $CLUSTER_NAME.yaml
eksctl anywhere create cluster -f $CLUSTER_NAME.yaml
terraform import kubernetes_manifest.cluster_ok_cluster "apiVersion=anywhere.eks.amazonaws.com/v1alpha1,kind=Cluster,namespace=default,name=ok-cluster"
terraform apply
```

### Added csi-driver for statefull workload:

```bash
git clone https://github.com/kubernetes-csi/csi-driver-host-path.git
cd csi-driver-host-path/
make
deploy/kubernetes-latest/deploy.sh
kubectl get csinodes
for i in ./examples/csi-storageclass.yaml ./examples/csi-pvc.yaml ./examples/csi-app.yaml; do kubectl apply -f $i; done
````

Load balancing is available as a paid package for now. So local port-forwards are for publishing stuff. For now.