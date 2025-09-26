terraform {
  backend "azurerm" {
    sas_token            = "sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2025-10-09T19:07:20Z&st=2025-09-26T10:52:20Z&spr=https&sig=mlMiJJOo53eWj%2FWp7ZVQ5HY04fhydgszTJ0sl2OE3IQ%3D"  # Can also be set via `ARM_SAS_TOKEN` environment variable.
    storage_account_name = "sunday25augstg1"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "youcanuseit"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                 # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
    subscription_id = var.subscription_id
}