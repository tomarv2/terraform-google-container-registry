data "external" "gcr_image_info" {
  program = ["sh", "${path.module}/scripts/folder_contents.sh", var.dockerfile_folder]
}

resource "null_resource" "gcr_docker_image" {
  triggers = {
    build_folder_content_md5 = data.external.gcr_image_info.result.md5
  }
  provisioner "local-exec" {
    command = local.build_command
  }
}

locals {
  build_command = <<EOF
        ${path.module}/scripts/build.sh ${var.name}:${var.tag} ${data.google_project.project.name} ${var.dockerfile_folder}
    EOF
}

data "google_project" "project" {}
