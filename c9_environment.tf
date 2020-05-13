resource "aws_cloud9_environment_ec2" "this" {
  instance_type = "t3.small"
  name          = "EKS Fargate Dev Lab"
}
