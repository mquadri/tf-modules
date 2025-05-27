variable "name" {
  description = "Name for the database to be created"
  type        = string
}

variable "sql_managed_instance_id" {
  description = "ID of the SQL Managed Instance where the database will be created"
  type        = string
}
