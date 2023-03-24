module "iam" {
  source = "./modules/iam"
  group_name = var.group_alias
  
  for_each = { for name in var.users_name : name => name }

  user_name = each.value
}