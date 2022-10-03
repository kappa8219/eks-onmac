# EKS OnMac

```bash
export CLUSTER_NAME=ok-cluster
eksctl anywhere generate clusterconfig $CLUSTER_NAME --provider docker > $CLUSTER_NAME.yaml
eksctl anywhere create cluster -f $CLUSTER_NAME.yaml
terraform import kubernetes_manifest.cluster_ok_cluster "apiVersion=anywhere.eks.amazonaws.com/v1alpha1,kind=Cluster,namespace=default,name=ok-cluster"
```

