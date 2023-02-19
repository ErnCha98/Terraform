resource "aws_iam_user" "users" {
  name = "juan-rosales"
}

resource "aws_iam_user_group_membership" "group-lab" {
  user = aws_iam_user.users.name
  groups = ["min-labs"]
}

resource "aws_iam_access_key" "key"{
    user =aws_iam_user.users.name
    pgp_key= data.local_file.pgp_key.content_base64
}

output "access_key"{
    value=aws_iam_access_key.key.id
}

output "encrypted_secret"{
    value = aws_iam_access_key.key.encrypted_secret
}

output "user_arn"{
    value =aws_iam_user.users.arn
}