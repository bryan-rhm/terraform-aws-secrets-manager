variable "name" {
    type        = string
    default     = null
    description = " Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@- Conflicts with name_prefix."
}

variable "name_prefix" {
    type        = string
    default     = null
    description = "Name Prefix for the resource"
}

variable "kms_key_arn" {
    type        = string
    default     = null
    description = "Customer Master Key Id to be used to encrypt the secrets values"
}

variable "description" {
    type        = string
    default     = null
    description = "(Optional) Description of the secret."
}

variable "recovery_window_in_days" {
    type        = number
    default     = 30
    description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
}

variable "region" {
    type        = string
    default     = null
    description = "Region for replication the secret"
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "Key-value map of user-defined tags that are attached to the secret."
}

variable "rotation_lambda_arn" {
    type        = string
    default     = null
    description = "Lambda ARN"
}
variable "automatically_after_days" {
    type        = number
    default     = 7
    description = "Specifies the number of days between automatic scheduled rotations of the secret."
}

variable "secret_string" {
    type        = string
    default     = null 
    description = "(Optional) Specifies text data that you want to encrypt and store in this version of the secret. This is required if secret_binary is not set."
}

variable "secret_binary" {
    type        = string
    default     = null 
    description = "(Optional) Specifies binary data that you want to encrypt and store in this version of the secret. This is required if secret_string is not set. Needs to be encoded to base64."
}

variable "version_stages" {
    type        = list(string)
    default     = ["AWSCURRENT"]
    description = "Specifies the secret version that you want to retrieve by the staging label attached to the version. Defaults to AWSCURRENT"
}