resource "aws_ecr_repository" "techchallenge_repo" {
  name                 = "techchallenge"
  image_tag_mutability = "MUTABLE"
}
