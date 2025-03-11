resource "kind_cluster" "k8s" {
    name = "test-cluster"
    node_image = "kindest/node:v1.27.1"
}