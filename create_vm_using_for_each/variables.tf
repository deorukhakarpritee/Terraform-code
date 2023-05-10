variable "prefix" {

  default = "lab"

}

variable "location" {

  type = string

}

variable "vm_name" {

  type = set(string)

}

variable "address_space" {

  type = list(any)

}

variable "address_prefixes" {

  type = list(any)

}

variable "vm_size" {

  type = string
}

variable "admin_username" {

  type = string

}

variable "admin_password" {

  type = string

}

variable "publisher" {

  type = string

}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "msversion" {

  type = string
}
