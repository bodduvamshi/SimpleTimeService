output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_loadbalancer_dns" {
  value = kubernetes_service.app.status[0].load_balancer[0].ingress[0].hostname
}
