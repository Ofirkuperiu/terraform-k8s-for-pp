resource "kubernetes_deployment" "web_app" {
  metadata {
    name = "web-app-deployment"
    labels = {
      app = "web-app"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "web-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-app"
        }
      }

      spec {
        container {
          name  = "web-app-container"
          image = "nginx:latest"  # Replace with your image if needed
          port {
            container_port = 80
          }

          volume_mount {
            name       = "html-content"
            mount_path = "/usr/share/nginx/html"
            read_only  = true
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 3
            period_seconds         = 5
          }

          readiness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 3
            period_seconds         = 5
          }
        }
        volume {
          name = "html-content"

          config_map {
              name = kubernetes_config_map.web_content.metadata[0].name
          }
        }
      }
    }
  }
}