output "domain_id" {
  value       = { for k, v in digitalocean_domain.domain : k => v.id }
  description = "The domain id if created"
}

output "domain_ttl" {
  value       = { for k, v in digitalocean_domain.domain : k => v.ttl }
  description = "The domain ttl if created"
}

output "domain_urn" {
  value       = { for k, v in digitalocean_domain.domain : k => v.urn }
  description = "The domain urn if created"
}

output "record_fqdn" {
  value       = { for k, v in digitalocean_record.records : k => v.fqdn }
  description = "FQDN of each record"
}

output "record_id" {
  value       = { for k, v in digitalocean_record.records : k => v.id }
  description = "Id of each record"
}
