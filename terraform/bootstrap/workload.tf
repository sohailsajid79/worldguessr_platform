resource "azurerm_resource_group" "dev" {
  provider = azurerm.online
  name     = "rg-${var.project}-dev"
  location = var.location
  tags     = merge(local.tags, { env = "dev" })
}

resource "azurerm_role_assignment" "github_dev_contributor" {
  provider             = azurerm.online
  scope                = azurerm_resource_group.dev.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.object_id
}

resource "azurerm_role_assignment" "github_state" {
  scope                = azurerm_storage_account.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.sp.object_id
}

resource "azurerm_role_assignment" "me_state" {
  scope                = azurerm_storage_account.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}