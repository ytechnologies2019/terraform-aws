terraform {
  cloud {
    organization = "thihathura"

    workspaces {
      name = "aws-workspace"
    }
  }
}