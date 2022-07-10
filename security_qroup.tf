resourse "aws_security_group" "webserver" {
    name="WebServerWWWAccess"
}

resource "aws_security_group_rule" "inbound_http" {
    from_port = 80
    protocol = "TCP"
    security_group_id = aws_security_group.webserver.security_group_id
    to_port = 80
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress" {
    from_port = 0
    protocol = "all"
    security_group_id = aws_security_group.webserver.security_group_id
    to_port = 0
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
}