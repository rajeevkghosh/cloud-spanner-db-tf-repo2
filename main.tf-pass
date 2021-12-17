provider "google" {

  access_token = var.access_token

}

resource "google_spanner_instance" "example2" {
  config       = "nam3"
  display_name = "cloud spanner instance-1"
  name         = "wf-us-prod-spn-app01-res01"
  project      = "airline1-sabre-wolverine"
  num_nodes    = 2

  labels = {
    application_division = "pci",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211122",
    environment          = "nonprod",
    gcp_region           = "us",
    owner                = "hybridenv",
  }

}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.example2.name
  name     = "wf-us-prod-spn-app01-db01"
  project  = "airline1-sabre-wolverine"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}