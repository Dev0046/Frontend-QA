bucket_name = "sprint5"

network_key = "QA/network.tfstate"
sg_key      = "QA/sg.tfstate"

region = "us-east-1"

template_names    = ["frontend-template"]
device_name       = ["/dev/sdf"]
volume_size_ebs   = [10]
volume_type_ebs   = ["gp3"]
key_names         = ["devinfrap9"]
image_ids         = ["ami-04a81a99f5ec58529"]
instance_types    = ["t2.micro"]
launch_template_tags = [
  {
    name        = "frontend-launch-template"
    environment = "QA"
  }
]
asg_name                             = ["frontend-asg"]
max_size                             = [1]
min_size                             = [1]
desired_capacity                     = [1]
health_check_grace_period            = [300]
launch_template_version              = ["$Default"]
autoscaling_policy_name              = ["frontend-policy"]
autoscaling_policy_policy_type       = "TargetTrackingScaling"
autoscaling_policy_adjustment_type   = "ChangeInCapacity"
autoscaling_policy_estimated_instance_warmup = [300]
autoscaling_policy_predefined_metric_type    = "ASGAverageCPUUtilization"
autoscaling_policy_target_value      = [60]
