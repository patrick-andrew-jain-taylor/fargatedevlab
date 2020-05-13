data "aws_iam_policy_document" "this" {
  version = "2012-10-17"
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  assume_role_policy = data.aws_iam_policy_document.this.json
  name               = "fargatedevlab-admin"
}

resource "aws_iam_instance_profile" "this" {
  name = "fargatedevlab-admin-profile"
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.this.name
}
