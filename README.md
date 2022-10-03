# EKS OnMac

```bash
export CLUSTER_NAME=ok-cluster
eksctl anywhere generate clusterconfig $CLUSTER_NAME --provider docker > $CLUSTER_NAME.yaml
eksctl anywhere create cluster -f $CLUSTER_NAME.yaml
```

