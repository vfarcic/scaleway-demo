terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

resource "scaleway_k8s_cluster" "dot" {
  name    = "dot"
  version = var.k8s_version
  cni     = "cilium"
  autoscaler_config {
    scale_down_delay_after_add      = "1m"
    scale_down_unneeded_time        = "1m"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
  }
}

resource "scaleway_k8s_pool" "main" {
  cluster_id = scaleway_k8s_cluster.dot.id
  name        = "main"
  node_type   = "DEV1-M"
  autoscaling = true
  autohealing = true
  size        = 3
  min_size    = 3
  max_size    = 10
}
