provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "resource_grp"
  location = "East US"
}

resource "azurerm_service_plan" "asp" {
  name                = "asp-github-cicd"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "my-azure-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }
}
