provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  region = "us-east-1"
  alias = "use1"
}

module "ssl_cert" {
  source  = "github.com/silksh-terraform-modules/terraform-aws-ssl-cert?ref=v0.0.2"

  tld = var.tld

  domain =  "${var.tld}"

  domain_alternatives = [
    "*.${var.tld}"
    ]
}

output "ssl_cert_zone_id" {
  value = module.ssl_cert.zone_id
}

output "ssl_cert_certificate_arn" {
  value = module.ssl_cert.certificate_arn
}


module "ssl_cert_us" {
  source  = "github.com/silksh-terraform-modules/terraform-aws-ssl-cert?ref=v0.0.2"

  providers = {
    aws = aws.use1
  }

  tld = var.tld

  domain =  "${var.tld}"

  domain_alternatives = [
    "*.${var.tld}"
    ]
}

output "ssl_cert_zone_id" {
  value = module.ssl_cert.zone_id
}

output "ssl_cert_certificate_arn" {
  value = module.ssl_cert.certificate_arn
}
