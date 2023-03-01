module "kind_cluster" {
  source = "./modules/kind-cluster"
  name   = "k8s-cluster-1"
  node_image = "kindest/node:v1.18.4"
}
