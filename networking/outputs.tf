#---networking/outputs.tf---

output "vpc_id" {
  value = aws_vpc.two_tier_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.two_tier_rds_subnetgroup.*.name
}

output "db_security_group" {
  value = [aws_security_group.two_tier_sg["rds"].id]
}