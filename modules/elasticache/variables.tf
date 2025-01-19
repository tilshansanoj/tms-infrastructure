variable "cluster_id" {
  description = "The ID of the Elasticache cluster"
  type        = string
}

variable "engine" {
  description = "The engine for the Elasticache cluster (e.g., redis, memcached)"
  type        = string
}

variable "node_type" {
  description = "The instance class for the Elasticache nodes"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Elasticache cluster"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the Elasticache cluster"
  type        = list(string)
}
