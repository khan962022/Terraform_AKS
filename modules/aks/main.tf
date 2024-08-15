
resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                  = "naseerkhan-aks-cluster"
  location              = var.location
  resource_group_name   = var.resource_group_name
  dns_prefix            = "${var.resource_group_name}-cluster"           
  kubernetes_version    =  "1.28"
  default_node_pool {
    name                 = "agentpool"
    vm_size              = "Standard_DS2_v2"
    node_count = 1
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "staging"
      "nodepoolos"       = "linux"
     } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "staging"
      "nodepoolos"       = "linux"
   } 
  }

  service_principal  {
    client_id = var.client_id
    client_secret = var.client_secret
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
      network_plugin = "kubenet"
      load_balancer_sku = "standard"
  }

    
  }


