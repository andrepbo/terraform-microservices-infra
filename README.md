# Terraform Project for Microservices Infrastructure

This Terraform project provisions the necessary infrastructure for two microservices: **microservice-nestjs-admin** and **microservice-nestjs-main**, using Docker to manage databases and services such as MySQL, MongoDB, and RabbitMQ.

## Prerequisites

Before you start, ensure you have the following tools installed on your machine:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Additionally, make sure to clone and set up the two microservice projects:

1. [microservice-nestjs-admin](https://github.com/andrepbo/microservice-nestjs-admin)
2. [microservice-nestjs-main](https://github.com/andrepbo/microservice-nestjs-main)

Follow the setup instructions in the respective repositories to install dependencies and configure the `.env` files.

## Structure

This Terraform project provisions the following resources using Docker:

- **MySQL**: Database for the **nestjs-admin** microservice.
- **MongoDB**: Database for the **nestjs-main** microservice.
- **RabbitMQ**: Messaging system used by the **nestjs-main** microservice.

## Setup

### 1. Clone this repository:

```bash
git clone https://github.com/andrepbo/terraform-microservices-infra.git
cd terraform-microservices-infra
```

### 2. Initialize Terraform

Before running any plan, initialize Terraform to download providers and prepare the environment:

```bash
terraform init
```

### 3. Plan and apply the infrastructure

You can check the execution plan with the following command:

```bash
terraform plan
```

If the plan looks good, apply it to provision the infrastructure:

```bash
terraform apply
```

### 4. Running the microservices

Once the infrastructure is provisioned, follow the steps in the individual projects to start the microservices.

For **microservice-nestjs-admin**, run:

```bash
$ npm run start:dev
```

For **microservice-nestjs-main**, run:

```bash
$ npm run start:dev
```

Both projects will rely on the Docker services that have been provisioned (MySQL, MongoDB, and RabbitMQ).

## Provisioned Resources

- **MySQL**: Docker container with MySQL 8.0 and data persistence.
- **MongoDB**: Docker container with MongoDB 6.0 and data persistence.
- **RabbitMQ**: Docker container with RabbitMQ (including the management interface).

## Contribution

If you'd like to contribute improvements or fixes, feel free to open issues or pull requests.

## Clean Up the Infrastructure

To destroy the provisioned infrastructure, run the following command:

```bash
terraform destroy
```