output "instance_private_ip" {
    description = "output of private ip address"
    value = aws_instance.webserver.private_ip
}