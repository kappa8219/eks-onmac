resource "kubernetes_manifest" "cluster_ok_cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "Cluster"
    "metadata" = {
      "name"      = "ok-cluster"
      "namespace" = "default"
    }
    "spec" = {
      "bundlesRef" = {
        "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
        "name"       = "bundles-17"
        "namespace"  = "eksa-system"
      }
      "clusterNetwork" = {
        "cniConfig" = {
          "cilium" = {}
        }
        "dns" = {}
        "pods" = {
          "cidrBlocks" = [
            "192.168.0.0/16",
          ]
        }
        "services" = {
          "cidrBlocks" = [
            "10.96.0.0/12",
          ]
        }
      }
      "controlPlaneConfiguration" = {
        "count" = 1
      }
      "datacenterRef" = {
        "kind" = "DockerDatacenterConfig"
        "name" = "ok-cluster"
      }
      "externalEtcdConfiguration" = {
        "count" = 1
      }
      "kubernetesVersion" = "1.21"
      "managementCluster" = {
        "name" = "ok-cluster"
      }
      "workerNodeGroupConfigurations" = [
        {
          "count" = 1
          "name"  = "md-0"
        },
      ]
    }
  }
}
