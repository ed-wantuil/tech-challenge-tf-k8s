#resource "aws_secretsmanager_secret" "example" {
#  name        = "example_secret_name"
#  description = "Example secret to be managed"
#}
#
#resource "aws_secretsmanager_secret_version" "example" {
#  secret_id     = aws_secretsmanager_secret.example.id
#  secret_string = "example_secret_string"
#}