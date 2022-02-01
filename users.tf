#Creating users
resource "aws_iam_user" "newusers" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_access_key" "newusers" {
  count   = length(var.username)
  user    = element(aws_iam_user.newusers.*.name, count.index)
  pgp_key = "keybase:alberto970604"
}

# Creating policies
resource "aws_iam_user_policy_attachment" "demo_attachment" {
  count      = length(var.username)
  user       = element(aws_iam_user.newusers.*.name, count.index)
  policy_arn = aws_iam_policy.ec2_full.arn
}

resource "aws_iam_user_login_profile" "newusers" {
    count = length(var.username)
    user = aws_iam_user.newusers[count.index].name
    password_reset_required = true
    pgp_key = "keybase:alberto970604"
}
