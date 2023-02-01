# --------------------------
# CONFIGURE OUR AZURE PROVIDER
# --------------------------

provider "azurerm" {  
  features {}
}

# ---------
# VARIABLES
# ---------
variable "location" {
  description = "Azure region in which instance will be hosted"
  type        = string
}

variable "environment" {
  description = "Name of the workload's environnement"
  type        = string
}

variable "workload_name" {
  description = "Name of the workload_name"
  type        = string
}

variable "org_name" {
  description = "Name of the organization"
  type        = string
}

variable "add_tags" {
  description = "Map of custom tags."
  type        = map(string)
  default     = {}
}

variable "enable_resource_locks" {
  description = "(Optional) Enable resource locks, default is false. If true, resource locks will be created for the resource group and the storage account."
  type        = bool
  default     = false
}

variable "lock_level" {
  description = "(Optional) id locks are enabled, Specifies the Level to be used for this Lock."
  type        = string
  default     = "CanNotDelete"
}

variable "custom_resource_group_name" {
  description = "(Optional) Custom name for the resource group. If not set, the module will generate a name based on the workload_name, environment and org_name."
  type        = string
  default     = null
}

# ---------------
# CREATE THE RG
# ---------------
module "rg" {
  source = "../../"

  location       = var.location  
  org_name       = var.org_name
  environment    = var.environment
  workload_name  = var.workload_name
  custom_rg_name = var.custom_resource_group_name != null ? var.custom_resource_group_name : null

  add_tags = var.add_tags
}

# -------
# OUTPUTS
# -------
output "resource_group_name" {
  value       = module.rg.resource_group_name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = module.rg.resource_group_id
  description = "Resource group generated id"
}

output "resource_group_location" {
  value       = module.rg.resource_group_location
  description = "Resource group location (region)"
}
