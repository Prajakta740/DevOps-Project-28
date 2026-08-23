resource "aws_eks_cluster" "eks_cluster" {
  name     = "chatbot-ai"
  role_arn = aws_iam_role.EKSClusterRole.arn
  version  = "1.33"

  vpc_config {
    subnet_ids = [
      "subnet-0c94ec4045b1d8b81",
      "subnet-05d1825944a182b2a"
    ]

    security_group_ids = [
      "sg-0608649d976b55966"
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}
