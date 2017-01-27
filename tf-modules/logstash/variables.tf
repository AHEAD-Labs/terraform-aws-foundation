variable "name_prefix" {
  default = "dev"
  description = "Prefix that will be added to names of all resources"
}

variable "ami" {
  description = "AMI to use for instances running Logstash"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "min_server_count" {
  description = "Minimum number of EC2 instances running Logstash"
  default = 1
}

variable "max_server_count" {
  description = "Maximum number of EC2 instances running Logstash"
  default = 1
}

variable "desired_server_count" {
  description = "Desired number of EC2 instances running Logstash"
  default = 1
}

variable "vpc_id" {
  description = "VPC id where Logstash servers should be deployed in"
}

variable "vpc_azs" {
  description = "A list of availability zones to deploy Logstash servers in"
  type = "list"
}

variable "subnet_ids" {
  description = "A list of subnet ids to deploy Logstash servers in"
  type = "list"
}

variable "logstash_dns_name" {
  description = "DNS name for Logstash endpoint"
}

variable "route53_zone_id" {
  description = "Route53 Zone id where ELB should get added a record to"
}

variable "elasticsearch_url" {
  description = "Elasticsearch endpoint url"
}

variable "key_name" {
  description = "SSH key name to use for connecting to all nodes"
}

variable "ca_cert" {
  description = "CA certificate file path. Configures Logstash to trust clients with certificates signed by this CA"
}

variable "server_cert" {
  description = "Path to certificate that Logstash will use to authenticate with the client"
}

variable "credstash_kms_key_arn" {
  description = "Master KMS key ARN for getting SSL server key using credstash"
}

variable "credstash_server_key_name" {
  description = "Name of the SSL server key, to be used by credstash to pull the SSL key"
}

variable "credstash_dynamic_config_name" {
  description = "This a key for credstash to be used to poll dynamic configuration for logstash, thus creating an ability to remotely update logstash fiters during runtime."
}

variable "credstash_dynamic_config_poll_schedule" {
  default = "*/5 * * * *"
  description = "Cron schedule for polling logstash dynamic configuration using credstash. Default is every 5 minutes"  
}

variable "extra_setup_snippet" {
  default = ""
  description = "Extra snippet to run after logstash has been installed and configured"
}

variable "extra_settings" {
  default = ""
  description = "Extra Logstash setting in YAML format"
}

variable "extra_security_groups" {
  default = []
  description = "Security groups, besides the default one, to be used fo logstash instances"
}
