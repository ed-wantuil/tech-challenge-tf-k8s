resource "aws_ecr_repository" "my_repo" {
  name                 = "techchallenge"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
