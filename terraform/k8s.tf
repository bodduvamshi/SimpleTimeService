resource "kubernetes_deployment" "simpletimeservice" {
  metadata {
    name      = "simpletimeservice"
    namespace = "default"
    labels = {
      app = "simpletimeservice"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "simpletimeservice"
      }
    }

    template {
      metadata {
        labels = {
          app = "simpletimeservice"
        }
      }

      spec {
        container {
          name  = "simpletimeservice"
          image = var.container_image

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simpletimeservice" {
  metadata {
    name      = "simpletimeservice"
    namespace = "default"
  }

  spec {
    selector = {
      app = kubernetes_deployment.simpletimeservice.metadata[0].labels.app
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 8080
      protocol    = "TCP"
    }
  }
}
