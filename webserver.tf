module "webserver" {
  sourse = "./instance_module"
  instance_profile = aws_iam_instance_profile.web_console_session.id
  security_group = aws_security_group.webserver.id
}