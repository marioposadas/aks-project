variable "resource_group_name" {
  description = "Nombre del Resource Group creado previamente en Azure."
  type        = string
  default     = "rg-aks-project"
}

variable "aks_cluster_name" {
  description = "Nombre del clúster AKS."
  type        = string
  default     = "aks-project-cluster"
}

variable "dns_prefix" {
  description = "Prefijo DNS del clúster."
  type        = string
  default     = "aksproject"
}

variable "node_count" {
  description = "Cantidad de nodos. Para ahorrar crédito, usar 1."
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Tamaño de VM del nodo. Cambia si Azure no tiene cuota disponible."
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Usuario administrador Linux para los nodos."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Ruta de la llave pública SSH."
  type        = string
  default     = "~/.ssh/aks_terraform_rsa.pub"
}
