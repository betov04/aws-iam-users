/*output "secret" {
  value = "${aws_iam_access_key.newusers.*}"
  sensitive = true
}
*/
output "user_arn" {
  value = "${aws_iam_user.newusers.*.arn}"
}

output "secret" {
  value = aws_iam_access_key.newusers
  sensitive = true
}

output "password" {
  value = aws_iam_user_login_profile.newusers.*.encrypted_password
}