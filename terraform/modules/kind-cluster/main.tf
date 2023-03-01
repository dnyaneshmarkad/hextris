resource "kind_cluster" "default" {
    name = var.name
    node_image = var.node_image
    kind_config = file("${path.module}/kind-config.yaml")
}
