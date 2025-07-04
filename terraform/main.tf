locals {
  required_tags = {
    Project    = "Unknown"
    CostCenter = "0000"
    Owner      = "Unknown"
  }
}

resource "aws_cloudformation_stack" "tag_enforcement" {
  name          = "aft-required-tags"
  template_body = file("${path.module}/cfn-required-tags.yaml")

  parameters = {
    TagMap = jsonencode(local.required_tags)
  }
}