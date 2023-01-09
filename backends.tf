terraform {
  cloud {
    organization = "timk"

    workspaces {
      name = "mtc-dev"
    }
  }
}