data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.bucket_name
    key    = var.network_key
    region = var.region
  }
}

data "terraform_remote_state" "SG" {
  backend = "s3"
  config = {
    bucket = var.bucket_name
    key    = var.sg_key
    region = var.region
  }
}

module "Frontend" {

  source = "github.com/mygurkulam-p9/Terrform_Module.git//AutoScaling?ref=AutoScaling"

 template_names                    = var.template_names
  device_name                       = var.device_name
  volume_size_ebs                   = var.volume_size_ebs
  volume_type_ebs                   = var.volume_type_ebs
  
 subnet_ids = [
  data.terraform_remote_state.network.outputs.private_subnet_id[0] 
]

 security_groups = [
  data.terraform_remote_state.SG.outputs.frontend_security_group_id[0]
 ]

  key_names                         = var.key_names
  image_ids                         = var.image_ids
  instance_types                    = var.instance_types
  launch_template_tags              = var.launch_template_tags
  asg_name                          = var.asg_name
  max_size                          = var.max_size
  min_size                          = var.min_size
  desired_capacity                  = var.desired_capacity
  health_check_grace_period         = var.health_check_grace_period
  launch_template_version           = var.launch_template_version
  
  vpc_zone_identifier = [
  data.terraform_remote_state.network.outputs.private_subnet_id[0]
  ]

  target_group_arns = [
    data.terraform_remote_state.network.outputs.target_group_arn[0]
  ]

  autoscaling_policy_name           = var.autoscaling_policy_name
  autoscaling_policy_policy_type    = var.autoscaling_policy_policy_type
  autoscaling_policy_adjustment_type = var.autoscaling_policy_adjustment_type
  autoscaling_policy_estimated_instance_warmup = var.autoscaling_policy_estimated_instance_warmup
  autoscaling_policy_predefined_metric_type    = var.autoscaling_policy_predefined_metric_type
  autoscaling_policy_target_value   = var.autoscaling_policy_target_value
}
