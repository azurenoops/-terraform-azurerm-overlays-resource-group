locals {
  default_tags = var.default_tags_enabled ? {
    env      = var.environment
    workload = var.workload_name
  } : {}
}
