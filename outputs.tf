output "resource_group_name" {
  value = data.azurerm_resource_group.main.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_admin_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive = true
}

output "connect_command" {
  value = "az aks get-credentials --resource-group ${data.azurerm_resource_group.main.name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
}
