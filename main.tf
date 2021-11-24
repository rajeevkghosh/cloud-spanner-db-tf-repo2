provider "google" {

access_token = var.access_token

}

resource "google_spanner_instance" "example2" {
  config       = "nam3"
  display_name = "us_dev_abcd_fghi_spanner1"
  project      = "airline1-sabre-wolverine"
  num_nodes    = 2
  
  labels = {
    env                  = "default"
    application_division = "pci",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211122",
    data_compliance      = "pci",
    data_confidentiality = "pub",
    data_type            = "test",
    environment          = "dev",
    gcp_region           = "us",
    owner                = "hybridenv",
  }
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.example2.name
  name     = "us_dev_abcd_fghi_spdbase1"
  project      = "airline1-sabre-wolverine"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}