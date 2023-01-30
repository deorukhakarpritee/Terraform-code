variable "rg_config" {

  type = list(object({
    create_rg = bool
    name = string
    location = string
  }))
  
}

