variable "zone" {
  description = "zone"
  type        = string
  default     = "ru-central1-a"
}

variable "platform_id" {
  description = "platform id"
  type        = string
  default     = "standard-v1"
}

variable "core_count" {
  description = "core count"
  type        = string
  default     = "2"
}

variable "memory_value" {
  description = "memory value"
  type        = string
  default     = "4"
}

variable "instance_subnet_id" {
  description = "instance subnet id"
  type        = string
  default     = ""
}

variable "image_id" {
  description = "image id"
  type        = string
  default     = ""
}