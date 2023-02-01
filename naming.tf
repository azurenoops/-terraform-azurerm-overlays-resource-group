data "azurenoopsutils_resource_name" "rg" {
  name          = var.workload_name
  resource_type = "azurerm_resource_group"
  prefixes      = [var.org_name, var.location]
  suffixes      = compact([var.name_prefix == "" ? null : local.name_prefix, var.environment, local.name_suffix, var.use_naming ? "" : local.anoa_slug])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}
