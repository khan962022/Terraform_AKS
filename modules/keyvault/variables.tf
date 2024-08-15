variable "keyvault_name" {
    type = string
}

variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}

variable "service_principal_name" {
    type = string
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = ""
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = ""
}


variable "service_principal_object_id" {}
variable "service_principal_tenant_id" {}