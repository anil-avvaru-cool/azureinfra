param environment string
param storageAccountName string
param location string

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    env: environment
  }
}

resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  name: 'default'
  parent: storageAccount
}

resource container1 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  name: 'tf-state'
  parent: blobServices
}

resource container2 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  name: 'data'
  parent: blobServices
}

output primaryBlobEndpoint string = storageAccount.properties.primaryEndpoints.blob
