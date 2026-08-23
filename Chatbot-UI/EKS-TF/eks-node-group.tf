resource "aws_eks_node_group" "eks-node-group" {

  cluster_name    = "chatbot-ai"
  node_group_name = var.eksnode-group-name
  node_role_arn   = aws_iam_role.NodeGroupRole.arn

  subnet_ids = [
    "subnet-0c94ec4045b1d8b81"
  ]

  scaling_config {
    desired_size = 0
    min_size     = 0
    max_size     = 1
  }

  ami_type       = "AL2023_x86_64_STANDARD"
  instance_types = ["t3.medium"]
  disk_size      = 20

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}
