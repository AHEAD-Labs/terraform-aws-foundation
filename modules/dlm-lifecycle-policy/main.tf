/**
* ## Data Lifecycle Manager (DLM) lifecycle policy for managing snapshots
*
* The purpose of this module is to provide a policy to create snapshots accourding an schudule.
* This module creates an IAM role and a policy that manage the creation of EBS snapshots, Data Lifecycle Manager policy let you create snapshots according to the schedule that you choose.
*
* The module supports:
*
* * Generate snapshots of volumes attached to ec2 instances
* * Assume the IAM Role policy to manage DLM lifecycle policy
*
*/

# DLM lifecycle schedule
resource "aws_dlm_lifecycle_policy" "gitlab-ebs-lifecycle-policy" {
  description        = "${var.dml_description}"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle_role.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = "${var.dml_resource_type}"

    schedule {
      name = "${var.schedule_name}"

      create_rule {
        interval      = "${var.schedule_interval}"
        interval_unit = "${var.schedule_interval_unit}"
        times         = "${var.schedule_times}"
      }

      retain_rule {
        count = "${var.schedule_retain_rule}"
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }

      copy_tags = "${var.schedule_copy_tags}"
    }

    target_tags = "${var.ebs_target_tags}"

  }
}
