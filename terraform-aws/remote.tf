terraform {
  cloud {
    organization = "my-organization-by-ytechnologies"

    workspaces {
      name = "more-than-certified-workspace"
    }
  }
}