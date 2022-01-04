resource "aws_secretsmanager_secret" "this" {
    name                    = var.name
    kms_key_id              = var.kms_key_arn
    name_prefix             = var.name_prefix
    description             = var.description
    recovery_window_in_days = var.recovery_window_in_days

    dynamic "replica" {
      for_each = var.region != null ? ["enabled_replica"] : []
      content {
        kms_key_id          = var.kms_key_arn
        region              = var.region  
      }
    }

    tags = var.tags
}

resource "aws_secretsmanager_secret_rotation" "this" {
  count               = var.rotation_lambda_arn != null ? 1 : 0
  secret_id           = aws_secretsmanager_secret.this.id
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.automatically_after_days
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id      = aws_secretsmanager_secret.this.id
  secret_string  = var.secret_string
  secret_binary  = var.secret_binary
  version_stages = var.version_stages
}
