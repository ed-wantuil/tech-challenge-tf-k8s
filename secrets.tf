resource "aws_secretsmanager_secret" "techchallenge" {
  name        = "techchallenge-final"
  description = "Vault do techchallenge"
}

resource "aws_secretsmanager_secret_version" "techchallenge" {
  secret_id     = aws_secretsmanager_secret.techchallenge.id
  secret_string = jsonencode({
    username = var.database_username
    password = var.database_password
  })
}
