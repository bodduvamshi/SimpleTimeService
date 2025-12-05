output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "loadbalancer_dns" {
  value = try(
    kubernetes_service.simpletimeservice.status[0].load_balancer[0].ingress[0].hostname,
    kubernetes_service.simpletimeservice.status[0].load_balancer_ingress[0].hostname
  )
}
