resource "aws_eks_node_group" "eks-node-group" {

  cluster_name    = "chatbot-ai"
  node_group_name = var.eksnode-group-name
  node_role_arn   = aws_iam_role.NodeGroupRole.arn

  subnet_ids = [
    "subnet-06ec860092db8ce7a"
  ]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  ami_type       = "AL2023_x86_64_STANDARD"
  instance_types = ["t3.xlarge"]
  disk_size      = 40

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}
