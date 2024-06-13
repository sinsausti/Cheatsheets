### Terraform Cheatsheet

#### Basics

- **Install Terraform:**
  ```sh
  curl -LO https://releases.hashicorp.com/terraform/<VERSION>/terraform_<VERSION>_linux_amd64.zip
  unzip terraform_<VERSION>_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  terraform --version
  ```

- **Terraform version:**
  ```sh
  terraform version
  ```

- **Terraform help:**
  ```sh
  terraform help
  ```

#### Terraform Initialization

- **Initialize a working directory:**
  ```sh
  terraform init
  ```

- **Reconfigure a working directory:**
  ```sh
  terraform init -reconfigure
  ```

#### Terraform Configuration

- **Validate the configuration:**
  ```sh
  terraform validate
  ```

- **Format configuration files:**
  ```sh
  terraform fmt
  ```

- **Validate and format configuration files:**
  ```sh
  terraform fmt -check
  ```

#### Terraform Planning and Applying

- **Generate and show an execution plan:**
  ```sh
  terraform plan
  ```

- **Apply changes to reach the desired state:**
  ```sh
  terraform apply
  ```

- **Auto-approve apply changes:**
  ```sh
  terraform apply -auto-approve
  ```

- **Destroy infrastructure:**
  ```sh
  terraform destroy
  ```

- **Auto-approve destroy infrastructure:**
  ```sh
  terraform destroy -auto-approve
  ```

#### Terraform State Management

- **Show the current state:**
  ```sh
  terraform show
  ```

- **List resources in the state:**
  ```sh
  terraform state list
  ```

- **Show specific resource details:**
  ```sh
  terraform state show <resource_name>
  ```

- **Remove resource from the state:**
  ```sh
  terraform state rm <resource_name>
  ```

- **Move a resource to a new address:**
  ```sh
  terraform state mv <old_resource_name> <new_resource_name>
  ```

#### Terraform Graph

- **Generate a visual graph of the plan:**
  ```sh
  terraform graph | dot -Tpng > graph.png
  ```

#### Terraform Variables

- **Define a variable in configuration:**
  ```hcl
  variable "instance_type" {
    description = "Type of instance"
    type        = string
    default     = "t2.micro"
  }
  ```

- **Pass variable values in a file:**
  ```sh
  terraform apply -var-file="variables.tfvars"
  ```

- **Pass variable values directly:**
  ```sh
  terraform apply -var='instance_type=t2.medium'
  ```

#### Terraform Outputs

- **Define an output in configuration:**
  ```hcl
  output "instance_ip" {
    description = "The IP address of the instance"
    value       = aws_instance.example.public_ip
  }
  ```

- **Show outputs:**
  ```sh
  terraform output
  ```

- **Show specific output:**
  ```sh
  terraform output <output_name>
  ```

#### Terraform Modules

- **Use a module in configuration:**
  ```hcl
  module "vpc" {
    source = "./modules/vpc"
    cidr_block = "10.0.0.0/16"
  }
  ```

#### Terraform Workspaces

- **List all workspaces:**
  ```sh
  terraform workspace list
  ```

- **Show the current workspace:**
  ```sh
  terraform workspace show
  ```

- **Create a new workspace:**
  ```sh
  terraform workspace new <workspace_name>
  ```

- **Switch to another workspace:**
  ```sh
  terraform workspace select <workspace_name>
  ```

- **Delete a workspace:**
  ```sh
  terraform workspace delete <workspace_name>
  ```

#### Terraform Providers

- **Declare a provider in configuration:**
  ```hcl
  provider "aws" {
    region = "us-west-2"
  }
  ```

- **Initialize the provider:**
  ```sh
  terraform init
  ```

#### Terraform Import

- **Import existing infrastructure into Terraform:**
  ```sh
  terraform import <resource_type>.<resource_name> <resource_id>
  ```

#### Terraform Console

- **Start a console for evaluating expressions:**
  ```sh
  terraform console
  ```

- **Exit the console:**
  ```sh
  exit
  ```
