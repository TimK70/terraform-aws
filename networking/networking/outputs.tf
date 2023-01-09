#---networking/outputs.tf---

output "vpc_id" {
  value = aws_vpc.two_tier_vpc.id
}