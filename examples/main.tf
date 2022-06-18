provider "aws" {
  region = "us-east-1"
}

module "secrets_manager" {
  source = "../"
  
  name            = "my-secret"
  secret_string   = jsonencode({
      DB_HOST     = "db.example.com",
      DB_USER     = "user",
      DB_PASSWORD = "password"
  })
}

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