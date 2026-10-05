resource "aws_eks_cluster" "eks_cluster" {
  name     = "chatbot-ai"
  role_arn = aws_iam_role.EKSClusterRole.arn
  version  = "1.34"

  vpc_config {
    subnet_ids = [
      "subnet-06ec860092db8ce7a",
      "subnet-097a4bacad2841229"
    ]

    security_group_ids = [
      "sg-099b40c6245147234"
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}
