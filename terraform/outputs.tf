output "instance_public_ip" {
    description = "output of private ip address"
    value = aws_instance.webserver.public_ip
}