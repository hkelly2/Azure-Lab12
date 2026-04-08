@description('Azure region for the Static Web App.')
param location string = resourceGroup().location

@description('Short globally-unique lowercase prefix used to name the resource.')
@minLength(3)
@maxLength(16)
param appName string

@description('Static Web App pricing tier.')
@allowed(['Free', 'Standard'])
param staticWebAppSku string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2022-09-01' = {
  name:     'swa-${appName}'
  location: location
  sku: {
    name: staticWebAppSku
    tier: staticWebAppSku
  }
  properties: {}
}

output staticWebAppUrl string = 'https://${staticWebApp.properties.defaultHostname}'
