#PaaS SQL setup
module "paas-sql-server-db" {
  source                 = "../"
  application_sql_server = var.application_sql_server
}

#SQL MI setup
module "application-sql-mi" {
  source             = "../"
  application_sql_mi = var.application_sql_mi
}
