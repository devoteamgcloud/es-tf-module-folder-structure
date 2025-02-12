output "folder_ids" {
  description = "IDs of first level folders"
  value       = { for k, v in module.folders : k => v.id }
}

output "subfolder1_ids" {
  description = "IDs of second level folders" 
  value       = { for k, v in module.sub_folders1 : k => v.id }
}

output "subfolder2_ids" {
  description = "IDs of third level folders"
  value       = { for k, v in module.sub_folders2 : k => v.id }
}

output "subfolder3_ids" {
  description = "IDs of fourth level folders"
  value       = { for k, v in module.sub_folders3 : k => v.id }
}

output "subfolder4_ids" {
  description = "IDs of fifth level folders"
  value       = { for k, v in module.sub_folders4 : k => v.id }
}