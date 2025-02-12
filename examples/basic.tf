module "basic_folder_structure" {
  source = "devoteamgcloud/es-tf-module-folder-structure"
  
  parent_id = "organizations/123456789"
  deletion_protection = true
  
  folder_structure = {
  "ctl" : {
    "automation" : []
    "management" : []
    "billing" : []
    "security" : []
    "observability" : []
    "networking" : {
      "global" : []
      "emea" : []
      "latam" : []
    }
  },
    "dev" : []
  }
}