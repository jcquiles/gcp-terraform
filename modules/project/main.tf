resource "google_project" "this" {
  name            = ""
  project_id      = ""
  billing_account = ""
  auto_create_network = false 
}

resource "google_project_service" "with_for_each" {
  for_each                           = toset(var.apis_to_enable)
  project                            = data.google_project.this.id 
  service                            = each.value
  disable_disable_dependent_services = true  
}