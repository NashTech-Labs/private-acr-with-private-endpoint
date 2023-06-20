# private-acr-with-private-endpoint
This is a terraform module for creating private acr with private endpoint which will be connected with a subnet in the private vnet

## Inputs:

| variable name | description | type | required | default |
|--|--|--|--|--|
| resource_group_vnet_name | name of the vnet resource group | string | true | |
| vnet_name | name of the vnet | string | true | |
| subnet_name | name of the subnet to be used by acr | string | true | |
| acr_resource_group | resource group for acr | string | true | |
| acr_location | azure region where private acr resource should be provisioned | string | false | eastus |
| acr_name | name of acr | string | true | |
| acr_sku| acr sku (Basic, Standard, Premium) | string | false | Premium |
| tags | tags to be applied to the resources | map(string) | false | {} |
| private_endpoint_resource_group_name | name of the resource group to create the private endpoint in | string | true | |
| private_endpoint_name | name of the private endpoint to create | string | true | |
| private_dns_zone_name | name of the private dns zone | string | true | |
| private_endpoint_vnet_private_link_name | name of the private link (in private endpoint) to create for private endpoint and vnet | string | true | |
| private_endpoint_service_connection_name | private endpoint service connection name | string | true | |
| dns_zone_group | dns zone group name | string | true | |
| acr_agent_pool_name | name of the agent pool for ACR | string | false | acr-agent-pool
| acr_task | name of the task for ACR | string | false | acr-task |
| context_path | url of the context | string | true | |
| context_access_token |access token of the context | string | true | |

## Steps for Execution

- clone the repository
- cd public-acr-with-agentpool-and-task
- make sure azure cli is installed and logged in (if not already then install and log in first)
- create a terraform.tfvars file with the inputs for the variables
- run the following commands
  - terraform init
  - terraform fmt
  - terraform validate
  - terraform plan
  - terraform apply
