data "aws_iam_policy" "admin_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_group" "cicd_group" {
  name = var.group_name
}

# locals {
#   name_list = [for user in aws_iam_user.cicd_user : user.name]
# }

resource "aws_iam_group_membership" "cicd" {
  name  = aws_iam_group.cicd_group.name
  users = [ aws_iam_user.cicd_user.name]

  group = aws_iam_group.cicd_group.name
}

resource "aws_iam_group_policy_attachment" "iam_group_attach" {
  group      = aws_iam_group.cicd_group.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}
