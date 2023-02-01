# Azure Resource Group Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/rg/azurerm/)

Azure NoOps Accelerator terraform module that creates a Resource Group with optional resource lock that can be used with a [SCCA compliant Network]().

## Naming

Resource naming is based on the [Azure NoOps Accelerator Naming Utils](https://registry.terraform.io/providers/azurenoops/deployutils/latest/docs/resources/azurenoops_resource_name) to generate resource names.

## Usage

```hcl
module "mod_location" {
  source  = "azurenoops/azregions/azurerm"
  version = "~> 1.0"

  azure_region = var.location
}

module "mod_rg" {
  source  = "azurenoops/rg/azurerm"
  version = "~> 1.0"

  org_name = "myorg"
  environment = "dev"
  workload = "myapp"
  location = "eastus"
  lock_level = "ReadOnly"
}
```

## Providers

| Name | Version |
|------|---------|
| azurenoops | ~> 1.2 |
| azurerm | >= 1.32 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.resource_group_level_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_resource_group.main_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurenoops_resource_name.rg](https://registry.terraform.io/providers/azurenoops/deplpyutils/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| org\_name | Organization name/account used in naming | `string` | n/a | yes |
| custom\_rg\_name | Optional custom resource group name | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| environment | Project environment | `string` | n/a | yes |
| add\_tags | Additional tags to add. | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| lock\_level | Specifies the Level to be used for this RG Lock. Possible values are Empty (no lock), CanNotDelete and ReadOnly. | `string` | `""` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| workload | Workload name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_id | Resource group generated id |
| resource\_group\_location | Resource group location (region) |
| resource\_group\_name | Resource group name |
<!-- END_TF_DOCS -->

## Related documentation

Azure Lock management documentation: [docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json)