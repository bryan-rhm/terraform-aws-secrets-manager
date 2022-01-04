output "output" {
    description = "Secret manager attributes"
    sensitive   = true
    value       = {
        secret  = aws_secretsmanager_secret.this
        version = aws_secretsmanager_secret_version.this
    }
}