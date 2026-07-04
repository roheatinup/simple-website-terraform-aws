// Backend is configured at CI runtime using `terraform init -backend-config`.
// Keep this file empty so CI can supply backend settings via workflow secrets.

terraform {
  # backend configuration is provided by CI at init time
}

