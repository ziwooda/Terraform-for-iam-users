variable "users_name" {
    description = "names of iam users"
    type = list(string)
}

variable "group_alias" {
  description = "iam group name"
  type = string
}