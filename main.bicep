
param environment string = 'prod'

@minLength(3)
@maxLength(24)
@description('Provide a name for the storage account. Use only lowercase letters and numbers. The name must be unique across Azure.')
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

module stg './storage-base.bicep' = {
  name: 'myStorageDeployment'
  params: {
    environment: environment
    storageAccountName: storageAccountName
    location: location    
  }
}

output primaryBlobEndpoint string = stg.outputs.primaryBlobEndpoint
