# terraform-aws-basic-infra
Basic infra setup on AWS (VPC, EC2, SG, ELB, ASG, RDS)

* if .gitignore does not work with .terraform folder, the refer:
  * https://github.com/hashicorp/terraform-guides/issues/92
  * https://github.com/orgs/community/discussions/23052

* Initially, you are in the 'default' workspace, but you may want to have workspaces like 'dev' and/or 'prod'
  $ terraform workspace new dev
  $ terraform workspace new prod
  $ terraform workspace list
  $ terraform workspace select dev
 btw, notice a file named 'environment' under the '.terraform' folder, it contains the current environment selected.

 * This project makes use of the '*.tfvars' file present inside the variables folder. To plan and apply:
  $ terraform  plan -var-file=variables/dev.tfvars
  $ terraform apply -var-file=variables/dev.tfvars