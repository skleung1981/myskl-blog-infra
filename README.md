# myskl-developer-blog-infra

Build the infra on AWS for the blog using Terraform.

The objective of this repo is to build a personal blog using AWS serverless components using Terraform, one of the infrastructure of code (IaC) tool.

**This repo is originally from my local CI/CD environment using forgejo, this one you're viewing is the mirror version in GitHub.**

## How to use this repo

```
export AWS_PROFILE=<Profile>
cd envs/<environment>  #(either dev or prod)
terraform init
```

To see the change and apply the change

```
terraform plan
terraform apply
```

