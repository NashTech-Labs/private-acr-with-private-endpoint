##################
# VNET variables #
##################

# VNET RESOURCE GROUP NAME
variable "resource_group_vnet_name" {
  description = "name of the vnet resource group"
  type        = string
}

# VNET NAME
variable "vnet_name" {
  description = "name of the vnet"
  type        = string
}


####################
# SUBNET variables #
####################

# SUBNET NAME
variable "subnet_name" {
  description = "name of the subnet to be used by acr"
  type        = string
}


#################
# ACR variables #
#################

# ACR RESOURCE GROUP NAME
variable "acr_resource_group" {
  type    = string
}

# ACR RESOURCE GROUP LOCATION
variable "acr_location" {
  description = "azure region where private acr resource should be provisioned"
  type        = string
  default     = "eastus"
}

# ACR NAME
variable "acr_name" {
  type    = string
}

# ACR SKU
variable "acr_sku" {
  type    = string
  default = "Premium"
}

# ACR TAGS
variable "tags" {
  description = "tags to be applied to the resources"
  type        = map(string)
  default     = {}
}


##############################
# PRIVATE ENDPOINT variables #
##############################

# PRIVATE ENDPOINT RESOURCE GROUP NAME
variable "private_endpoint_resource_group_name" {
  description = "name of the resource group to create the private endpoint in"
  type        = string
}

# PRIVATE ENDPOINT NAME
variable "private_endpoint_name" {
  description = "name of the private endpoint to create"
  type        = string
}

# PRIVATE DNS ZONE NAME
variable "private_dns_zone_name" {
  description = "name of the private dns zone"
  type        = string
}

# PRIVATE ENDPOINT AND VNET PRIVATE LINK NAME
variable "private_endpoint_vnet_private_link_name" {
  description = "name of the private link (in private endpoint) to create for private endpoint and vnet"
  type        = string
}

# PRIVATE ENDPOINT SERVICE CONNECTION NAME
variable "private_endpoint_service_connection_name" {
  description = "private endpoint service connection name"
  type        = string
}

# DNS ZONE GROUP variable
variable "dns_zone_group" {
  type    = string
}

############################
# ACR AGENT POOL variables #
############################

# ACR AGENT POOL NAME
variable "acr_agent_pool_name" {
  description = "name of the agent pool for ACR"
  type        = string
  default     = "acr-agent-pool"
}

######################
# ACR TASK variables #
######################

# ACR TASK NAME
variable "acr_task" {
  description = "name of the task for ACR"
  type        = string
  default     = "acr-task"
}

variable "context_path" {
  description = "url of the context"
  type        = string
}

variable "context_access_token" {
  description = "access token of the context"
  type        = string
}
