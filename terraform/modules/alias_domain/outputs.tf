output "aws_route53_zone_id" {
  description = "ID of the Route53 zone"
  value       = aws_route53_zone.zone.zone_id
}
