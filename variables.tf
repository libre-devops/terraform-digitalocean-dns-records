variable "records" {
  description = "The records to be created for digital ocean"
  type        = list(object({
    create_domain     = optional(bool, false)
    record_type       = string
    record_name       = string
    record_value      = string
    domain_name       = string
    domain_ip_address = optional(string)
    port              = optional(number)
    priority          = optional(number)
    weight            = optional(number)
    ttl               = optional(number)
    flags             = optional(number)
    tag               = optional(string)
  }))
}
