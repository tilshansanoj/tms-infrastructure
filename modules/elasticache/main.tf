resource "aws_elasticache_subnet_group" "main" {
  name = var.cluster_id
  subnet_ids = var.subnet_ids
  
  tags = {
    Name = var.cluster_id
  }
}

resource "aws_elasticache_cluster" "name" {
  cluster_id = var.cluster_id
  engine = var.engine
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  subnet_group_name = aws_elasticache_subnet_group.main.name
  security_group_ids = var.security_group_ids

  tags = {
    Name = var.cluster_id
  }
}