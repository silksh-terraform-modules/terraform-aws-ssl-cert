module "ssl_cert" {
  source  = "github.com/silksh-terraform-modules/terraform-aws-ssl-cert?ref=v0.0.2"

  tld = var.tld

  # is_private_zone = false

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
