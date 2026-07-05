provider "azurerm" {
  features {}


}

resource "azurerm_resource_group" "rg" {
  name     = "rg-github-cicd"
  location = "East US"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "asp-github-cicd"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "my-azure-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    python_version = "3.10"
  }
}
