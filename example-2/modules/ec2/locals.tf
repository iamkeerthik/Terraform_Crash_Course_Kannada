# ------------------------
# Locals
# ------------------------
locals {
  # Common tags for all instances
  common_tags = {
    Environment = var.env_vars.env
    Project     = var.env_vars.project
    ManagedBy   = var.env_vars.managed_by
  }

  # Dynamic prefix for names
  name_prefix = "${var.env_vars.project}-${var.env_vars.env}"
}