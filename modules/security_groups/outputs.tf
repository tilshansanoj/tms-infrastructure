output "public_security_group" {
  description = "The ID of the pub-sec-group"
  value       = aws_security_group.public.id
}

output "private_security_group" {
  description = "The ID of the pub-sec-group"
  value       = aws_security_group.private.id
}