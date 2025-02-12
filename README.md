# devoteamgcloud/es-tf-module-folder-structure

This module helps create several folders under the same parent, enforcing consistent permissions, and with a common naming convention.

The resources/services/activations/deletions that this module will create/trigger are:

- Create folders with the provided names
- Assign the defined permissions to the provided list of users or groups.

## Compatibility

 This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-13.html)
  and need a Terraform 0.12.x-compatible version of this module, the last released version intended for
  Terraform 0.12.x is [2.0.2](https://registry.terraform.io/modules/terraform-google-modules/folders/google/2.0.2).

## Usage

Basic usage of this module is as follows:

```hcl
module "basic_folder_structure" {
  source = "devoteamgcloud/es-tf-module-folder-structure"
  
  parent_id = "organizations/123456789"
  
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

```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v1.3+
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v6

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Folder Creator: `roles/resourcemanager.folderCreator`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Cloud Resource Manager API: `cloudresourcemanager.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4, < 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_folders"></a> [folders](#module\_folders) | terraform-google-modules/folders/google | ~> 4.0 |
| <a name="module_sub_folders1"></a> [sub\_folders1](#module\_sub\_folders1) | terraform-google-modules/folders/google | ~> 4.0 |
| <a name="module_sub_folders2"></a> [sub\_folders2](#module\_sub\_folders2) | terraform-google-modules/folders/google | ~> 4.0 |
| <a name="module_sub_folders3"></a> [sub\_folders3](#module\_sub\_folders3) | terraform-google-modules/folders/google | ~> 4.0 |
| <a name="module_sub_folders4"></a> [sub\_folders4](#module\_sub\_folders4) | terraform-google-modules/folders/google | ~> 4.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Protection against deletion for level 3 and 4 folders | `bool` | `false` | no |
| <a name="input_folder_structure"></a> [folder\_structure](#input\_folder\_structure) | Nested folder structure up to 4 levels of depth | `map(map(map(map(list(string)))))` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | ID of the parent where the folders will be created (organizations/123456 or folders/123456) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_ids"></a> [folder\_ids](#output\_folder\_ids) | IDs of first level folders |
| <a name="output_subfolder1_ids"></a> [subfolder1\_ids](#output\_subfolder1\_ids) | IDs of second level folders |
| <a name="output_subfolder2_ids"></a> [subfolder2\_ids](#output\_subfolder2\_ids) | IDs of third level folders |
| <a name="output_subfolder3_ids"></a> [subfolder3\_ids](#output\_subfolder3\_ids) | IDs of fourth level folders |
| <a name="output_subfolder4_ids"></a> [subfolder4\_ids](#output\_subfolder4\_ids) | IDs of fifth level folders |
<!-- END_TF_DOCS -->