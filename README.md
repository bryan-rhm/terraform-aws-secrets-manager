# Terraform AWS Secret manager module

Terraform module for aws secret manager.

## Usage

The easiest way to create a secrets-manager's secret with terraform.

```hcl

module "secrets_manager" {
  source = "../"
  
  name            = "my-secret"
  secret_string   = jsonencode({
      DB_HOST     = "db.example.com",
      DB_USER     = "user",
      DB_PASSWORD = "password"
  })
}

```

Secret replicated on `us-east-2`

```hcl

module "secrets_manager_replica" {
  source = "../"
  
  name            = "my-secret-replicated"
  region          = "us-east-2"
  secret_string   = jsonencode({
      DB_HOST     = "db.example.com",
      DB_USER     = "user",
      DB_PASSWORD = "password"
  })
}
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_rotation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_rotation) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatically_after_days"></a> [automatically\_after\_days](#input\_automatically\_after\_days) | Specifies the number of days between automatic scheduled rotations of the secret. | `number` | `7` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the secret. | `string` | `null` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Customer Master Key Id to be used to encrypt the secrets values | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /\_+=.@- Conflicts with name\_prefix. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name Prefix for the resource | `string` | `null` | no |
| <a name="input_recovery_window_in_days"></a> [recovery\_window\_in\_days](#input\_recovery\_window\_in\_days) | Number of days that AWS Secrets Manager waits before it can delete the secret | `number` | `30` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for replication the secret | `string` | `null` | no |
| <a name="input_rotation_lambda_arn"></a> [rotation\_lambda\_arn](#input\_rotation\_lambda\_arn) | Lambda ARN | `string` | `null` | no |
| <a name="input_secret_binary"></a> [secret\_binary](#input\_secret\_binary) | (Optional) Specifies binary data that you want to encrypt and store in this version of the secret. This is required if secret\_string is not set. Needs to be encoded to base64. | `string` | `null` | no |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | (Optional) Specifies text data that you want to encrypt and store in this version of the secret. This is required if secret\_binary is not set. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of user-defined tags that are attached to the secret. | `map(string)` | `{}` | no |
| <a name="input_version_stages"></a> [version\_stages](#input\_version\_stages) | Specifies the secret version that you want to retrieve by the staging label attached to the version. Defaults to AWSCURRENT | `list(string)` | <pre>[<br>  "AWSCURRENT"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | Secret manager attributes |
