param location string
param vnet_name string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnet_name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'control-subnet'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'data-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
output vnetId string = virtualNetwork.id
