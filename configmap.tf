resource "kubernetes_config_map" "web_content" {
  metadata {
    name = "web-content"
  }

  data = {
    "index.html" = <<EOT
    <!DOCTYPE html>
    <html>
    <head>
        <title>My Static Web App</title>
    </head>
    <body>
        <h1>Welcome to My Static Web App</h1>
        <p>Served from Kubernetes ConfigMap</p>
    </body>
    </html>
    EOT
  }
}