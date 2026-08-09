targetScope = 'subscription'

@description('Azure region for the resource group.')
param location string = 'Central US'

@description('Production resource group name.')
param resourceGroupName string = 'carecache-prod-rg-01'

var tags = {
  application: 'carecache-site'
  environment: 'prod'
  managedBy: 'bicep'
}

resource applicationResourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

module application 'main.bicep' = {
  name: 'carecache-site-application'
  scope: applicationResourceGroup
  params: {}
}

output defaultHostname string = application.outputs.defaultHostname
output resourceGroupName string = applicationResourceGroup.name
output staticWebAppId string = application.outputs.staticWebAppId
output staticWebAppName string = application.outputs.staticWebAppName
