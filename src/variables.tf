variable "common_tags" {
    type = map
    description = "Tags to be applied to all resources"
}

variable "default_location" {
    type = string
    default = "East US 2"
    description = "Default location for resources"
}