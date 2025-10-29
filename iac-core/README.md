# iac-core

## Prerequisites

- Azure tenant with a subscription and permissions to create resources and app registrations
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?WT.mc_id=MVP_344197)
- [Terraform 1.13.3](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

### Deploy resources to host terraform state

1. Adjust values in `iac-core\vars\dev.core.tfvars`
1. Create resources to host terraform state by executing the following commands

   ```PowerShell
   az login -t [AZURE_TENANT_ID]
   cd [PATH_TO_REPOSITORY]\iac-core
   terraform init
   terraform apply --var-file=.\vars\dev.core.tfvars
   ```
