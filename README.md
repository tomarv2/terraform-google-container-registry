<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-container-registry/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-google-container-registry/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://github.com/tomarv2/terraform-google-container-registry/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://github.com/tomarv2/terraform-google-container-registry/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867" /></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"
            alt="follow on Twitter"></a>
</p>

## Terraform module for [Google Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/google/latest)

####

> :arrow_right:  Terraform module for [Azure Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/azure/latest)

> :arrow_right:  Terraform module for [AWS Container Registry](https://registry.terraform.io/modules/tomarv2/ecr/aws/latest)

### Versions

- Module tested for Terraform 1.0.1.
- Google provider version [4.12.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-container-registry/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-container-registry" /></a> in your releases)

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

##### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_PREFIX=<remote state bucket prefix>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=gcloud plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=gcloud apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=gcloud destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)
##### Google Container Registry
```
module "gcr" {
  source = "../"

  deploy_registry   = true
  gcp_project       = "demo-1000"
  dockerfile_folder = "scripts"
  name              = "test"
  #----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.


### Note

- Ensure there are executable permissions on `scripts/build.sh`

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->