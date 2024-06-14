#### APP SERVICE PLAN
resource "azurerm_storage_account" "apps_storage" {
  name                     = "stoapps${var.base_name}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_service_plan" "func_apps" {
  name                = "asp-${var.base_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"

  tags = var.tags
}


resource "azurerm_linux_function_app" "func_linux" {
  name                        = "func-linux-${var.base_name}-${var.environment}"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  storage_account_name        = azurerm_storage_account.apps_storage.name
  storage_account_access_key  = azurerm_storage_account.apps_storage.primary_access_key
  service_plan_id             = azurerm_service_plan.func_apps.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }
  
  tags = var.tags
}