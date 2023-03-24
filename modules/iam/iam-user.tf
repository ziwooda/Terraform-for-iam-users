 resource "aws_iam_user" "cicd_user" {
  name = "${var.user_name}"
}

resource "aws_iam_user_login_profile" "user_login" {
  user    = aws_iam_user.cicd_user.name
  password_reset_required = true
}

output "password" {
  value = aws_iam_user_login_profile.user_login.encrypted_password
  sensitive = true
}