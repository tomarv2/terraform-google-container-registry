<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-container-registry/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-google-container-registry/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://github.com/tomarv2/terraform-google-container-registry/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://github.com/tomarv2/terraform-google-container-registry/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-container-registry" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867" /></a>
    <a href="https://discord.gg/XH975bzN">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"
            alt="chat on Discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"
            alt="follow on Twitter"></a>
</p>

# Terraform module to create [Google Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/google/latest)

####

> :arrow_right:  Terraform module for [Azure Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/azure/latest)

> :arrow_right:  Terraform module for [AWS Container Registry](https://registry.terraform.io/modules/tomarv2/ecr/aws/latest)

# Versions

- Module tested for Terraform 0.14.
- Google provider version [3.58.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-container-registry/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-container-registry" /></a> in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Make required change to `examples` directory 

- Run and verify the output before deploying:
```
tf -cloud gcloud plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud gcloud apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud gcloud destroy -var-file <path to .tfvars file>
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| google | ~> 3.58 |

## Providers

| Name | Version |
|------|---------|
| external | n/a |
| google | ~> 3.58 |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_registry\_members | feature flag, true or false | `bool` | `true` | no |
| deploy\_registry | feature flag, true or false | `bool` | `true` | no |
| dockerfile\_folder | This is the folder which contains the Dockerfile | `string` | n/a | yes |
| gcp\_project | Name of the GCP project | `any` | n/a | yes |
| gcp\_region | n/a | `string` | `"us-central1"` | no |
| gcp\_token | GCP Authentication token. | `string` | `""` | no |
| gcr\_location | The location of the registry. One of ASIA, EU, US or not specified. See the official documentation for more information on registry locations. | `string` | `"US"` | no |
| name | Name of the image. | `string` | n/a | yes |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| tag | Image tag. | `string` | `"latest"` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| google\_bucket\_self\_link | Google project bucket self link |
| google\_project | Google project |

### Note

- Ensure there are executable permissions on `scripts/build.sh`