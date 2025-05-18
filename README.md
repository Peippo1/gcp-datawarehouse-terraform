![Terraform](https://img.shields.io/badge/Terraform-1.5.7-blue?logo=terraform&logoColor=white)
![Terraform CI](https://github.com/Peippo1/gcp-datawarehouse-terraform/actions/workflows/terraform-ci.yml/badge.svg)

# GCP Data Warehouse Terraform Project

This project provisions core infrastructure for a simple data warehouse setup in Google Cloud using Terraform.

### ✅ What it Deploys
- A **BigQuery dataset** named `google_trends`
- A **Google Cloud Storage bucket** (with randomized suffix) for staging data
- A **Compute Engine VM** (`linux-admin-vm`) configured with:
  - Debian 11
  - UFW firewall enabled (allowing SSH)
  - A dedicated `dataiku` user for installing and running Dataiku DSS
- IAM roles for secure access management

### 🌍 Deployment Context
- Region: `europe-west2` (London)
- Designed to run with `gcloud` Application Default Credentials
- Terraform manages infrastructure provisioning and IAM bindings

### 🚀 Getting Started

1. Authenticate with GCP:
   ```bash
   gcloud auth application-default login
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the deployment:
   ```bash
   terraform apply
   ```

5. View outputs:
   ```bash
   terraform output
   ```

### 🗃️ Notes
- The bucket is uniquely named using a random suffix to avoid naming conflicts.
- This project uses a simple dataset ID `google_trends` for demonstration purposes.
- UFW firewall is configured on the VM to restrict access, allowing only SSH by default.
- The VM is intended to be used for installing Dataiku DSS and related workloads.
- You can modify variables in `terraform.tfvars`.

---

This infrastructure forms the foundation for GCP-based analytics workflows and can be extended with BigQuery tables, scheduled queries, Dataiku integration, and more.

## Architecture Overview

```mermaid
graph TD
    Terraform[Terraform Configuration]
    BigQuery[BigQuery Dataset\ngoogle_trends]
    GCS[Cloud Storage Bucket\nStaging Bucket]
    ComputeVM[Compute Engine VM\nlinux-admin-vm]

    Terraform --> BigQuery
    Terraform --> GCS
    Terraform --> ComputeVM
```

## ⚙️ CI/CD Automation

This project includes a GitHub Actions workflow that performs the following on every pull request to `master`:

- Checks Terraform formatting (`terraform fmt`)
- Initializes the Terraform working directory (`terraform init`)
- Validates configuration syntax (`terraform validate`)
- Generates a plan to show what changes will be made (`terraform plan`)

It securely authenticates with GCP using a service account stored as a GitHub secret (`GCP_CREDENTIALS`), ensuring that infrastructure code is validated continuously without exposing sensitive credentials.