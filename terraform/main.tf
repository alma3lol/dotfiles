terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.24.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "rabbitmq" {
  name         = "rabbitmq:3-management"
  keep_locally = true
}

resource "docker_container" "rabbitmq" {
  name  = "rabbitmq"
  image = docker_image.rabbitmq.image_id
  restart = "unless-stopped"
  ports {
    internal = 5672
    external = 5672
  }
  ports {
    internal = 15672
    external = 15672
  }
}

resource "docker_image" "seq" {
  name         = "datalust/seq:latest"
  keep_locally = true
}

resource "docker_container" "seq" {
  name  = "datalust-seq"
  image = docker_image.seq.image_id
  env = ["ACCEPT_EULA=y"]
  restart = "unless-stopped"
  ports {
    internal = 80
    external = 5341
  }
}

resource "docker_image" "mariadb" {
  name         = "mariadb/server:10.3"
  keep_locally = true
}

resource "docker_container" "mariadb" {
  name  = "mariadb"
  image = docker_image.mariadb.image_id
  env = ["MARIADB_ROOT_PASSWORD=toor"]
  restart = "unless-stopped"
  ports {
    internal = 3306
    external = 3306
  }
}
