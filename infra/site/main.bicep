targetScope = 'resourceGroup'

@description('Azure region for the Static Web App.')
param location string = 'Central US'

@description('Static Web App resource name.')
param staticWebAppName string = 'carecache-prod-swa-01'

@allowed([
  'Free'
  'Standard'
])
param skuName string = 'Free'

var tags = {
  application: 'carecache-site'
  environment: 'prod'
  managedBy: 'bicep'
}

module staticWebApp 'static-web-app.bicep' = {
  name: 'carecache-site-static-web-app'
  params: {
    location: location
    name: staticWebAppName
    skuName: skuName
    tags: tags
  }
}

output defaultHostname string = staticWebApp.outputs.defaultHostname
output staticWebAppId string = staticWebApp.outputs.id
output staticWebAppName string = staticWebApp.outputs.name
