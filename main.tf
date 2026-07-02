terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "none"

  # Terraform usará las variables de entorno:
  # ARM_CLIENT_ID
  # ARM_CLIENT_SECRET
  # ARM_SUBSCRIPTION_ID
  # ARM_TENANT_ID
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = file(pathexpand(var.ssh_public_key_path))
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    project     = "aks-project"
    environment = "learning"
  }
}
