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

output "folder_ids" {
  value = merge(
    { for folder_name in keys(var.folder_structure) : folder_name => module.folders[folder_name].ids[folder_name] },
    { for path in local.sub_folders1_var : replace(path, "/=[0-9]+>/", "/") => module.sub_folders1[path].ids[element(split("=1>", path), 1)] },
    { for path in local.sub_folders2_var : replace(path, "/=[0-9]+>/", "/") => module.sub_folders2[path].ids[element(split("=2>", path), 1)] },
    { for path in local.sub_folders3_var : replace(path, "/=[0-9]+>/", "/") => module.sub_folders3[path].ids[element(split("=3>", path), 1)] },
    { for path in local.sub_folders4_var : replace(path, "/=[0-9]+>/", "/") => module.sub_folders4[path].ids[element(split("=4>", path), 1)] }
  )
}
