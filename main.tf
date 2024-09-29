terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_volume" "mysql_data" {
  name = "mysql_data"
}

resource "docker_volume" "mongo_data" {
  name = "mongo_data"
}

resource "docker_container" "mysql" {
  image = "mysql:8.0"
  name  = "mysql_db"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}",
  ]

  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }

  ports {
    internal = 3306
    external = 3306
  }
}

resource "docker_container" "mongo" {
  image = "mongo:6.0"
  name  = "mongo_db"

  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.mongo_root_username}",
    "MONGO_INITDB_ROOT_PASSWORD=${var.mongo_root_password}",
  ]

  volumes {
    volume_name    = docker_volume.mongo_data.name
    container_path = "/data/db"
  }

  ports {
    internal = 27017
    external = 27017
  }
}

resource "docker_container" "rabbitmq" {
  image = "rabbitmq:3-management"
  name  = "rabbitmq"

  env = [
    "RABBITMQ_DEFAULT_USER=${var.rabbitmq_default_user}",
    "RABBITMQ_DEFAULT_PASS=${var.rabbitmq_default_pass}",
  ]

  ports {
    internal = 5672
    external = 5672
  }

  ports {
    internal = 15672
    external = 15672
  }
}