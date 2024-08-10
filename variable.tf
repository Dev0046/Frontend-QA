variable "bucket_name" {
  description = "Name of the S3 bucket for remote state"
  type        = string
}

variable "network_key" {
  description = "Key for the network remote state file in S3"
  type        = string
}

variable "sg_key" {
  description = "Key for the SG remote state file in S3"
  type        = string
}

variable "region" {
  description = "AWS region for the remote state"
  type        = string
}

variable "template_names" {
  description = "List of template names"
  type        = list(string)
}

variable "device_name" {
  description = "List of device names"
  type        = list(string)
}

variable "volume_size_ebs" {
  description = "List of volume sizes for EBS"
  type        = list(number)
}

variable "volume_type_ebs" {
  description = "List of volume types for EBS"
  type        = list(string)
}

variable "key_names" {
  description = "List of key names for EC2 instances"
  type        = list(string)
}

variable "image_ids" {
  description = "List of AMI IDs"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types"
  type        = list(string)
}

variable "launch_template_tags" {
  description = "List of tags for the launch template"
  type        = list(map(string))
}

variable "asg_name" {
  description = "List of Auto Scaling Group names"
  type        = list(string)
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = list(number)
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = list(number)
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = list(number)
}

variable "health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = list(number)
}

variable "launch_template_version" {
  description = "Version of the launch template"
  type        = list(string)
}

variable "autoscaling_policy_name" {
  description = "List of autoscaling policy names"
  type        = list(string)
}

variable "autoscaling_policy_policy_type" {
  description = "Type of the autoscaling policy"
  type        = string
}

variable "autoscaling_policy_adjustment_type" {
  description = "Adjustment type for the autoscaling policy"
  type        = string
}

variable "autoscaling_policy_estimated_instance_warmup" {
  description = "Estimated instance warmup time in seconds"
  type        = list(number)
}

variable "autoscaling_policy_predefined_metric_type" {
  description = "Predefined metric type for autoscaling"
  type        = string
}

variable "autoscaling_policy_target_value" {
  description = "Target value for the autoscaling policy"
  type        = list(number)
}
