## Data Lifecycle Manager (DLM) lifecycle policy for managing snapshots

This module creates an IAM role and a policy that manage the creation of EBS snapshots, Data Lifecycle Manager policy let you create snapshots according to the schedule that you choose.

### Example how to use

Define the module in your terraform project:
```
variable "ebs_target_tags" {
  description = "EBS name/tag to query"
  default     = "myebstagname"
}

Define variables
...

module "ebs-backup-policy" {
  source = "git::https://github.com/fpco/terraform-aws-foundation//modules/dlm-lifecycle-policy"

  dml_description      = "${var.dml_description}"
  ebs_target_tags      = "${(map("Name", "${var.ebs_target_tags}")}"
  schedule_interval    = "${var.schedule_interval}"
  schedule_times       = "${var.schedule_interval_times}"
  schedule_retain_rule = "${var.schedule_retain_rule}"
}
```
