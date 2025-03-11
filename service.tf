resource "kubernetes_service" "web_app_service" {
  metadata {
    name = "web-app-service"
  }

  spec {
    selector = {
      app = "web-app"
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 32080
    }

    type = "NodePort"
  }
}