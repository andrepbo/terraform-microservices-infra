# MySQL Variables
variable "mysql_root_password" {
  description = "The MySQL root password"
  type        = string
  sensitive   = true
}

variable "mysql_database" {
  description = "The MySQL database name"
  type        = string
}

variable "mysql_user" {
  description = "The MySQL user"
  type        = string
}

variable "mysql_password" {
  description = "The MySQL user password"
  type        = string
  sensitive   = true
}

# MongoDB Variables
variable "mongo_root_username" {
  description = "The MongoDB root username"
  type        = string
}

variable "mongo_root_password" {
  description = "The MongoDB root password"
  type        = string
  sensitive   = true
}

# RabbitMQ Variables
variable "rabbitmq_default_user" {
  description = "The RabbitMQ default user"
  type        = string
}

variable "rabbitmq_default_pass" {
  description = "The RabbitMQ default password"
  type        = string
  sensitive   = true
}