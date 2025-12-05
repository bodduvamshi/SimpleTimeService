provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.auth.token
}

data "aws_eks_cluster_auth" "auth" {
  name = module.eks.cluster_id
}

resource "kubernetes_deployment" "simpletimeservice" {
  metadata {
    name = "simpletimeservice"
    labels = { app = "simpletimeservice" }
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "simpletimeservice" }
    }

    template {
      metadata {
        labels = { app = "simpletimeservice" }
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
    name = "simpletimeservice"
  }

  spec {
    selector = {
      app = kubernetes_deployment.simpletimeservice.metadata[0].labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 8080
    }
  }
}
