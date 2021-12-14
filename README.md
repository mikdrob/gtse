# Azure Functions

## Setup

- Create a `local.settings.json` with the following content
- Replace `xxx` with values from LastPass

```json
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "UseDevelopmentStorage=true",
    "FUNCTIONS_WORKER_RUNTIME": "node",
    "STORE_HASH": "xxx",
    "API_TOKEN": "xxx"
  },
  "Host": {
    "CORS": "*"
  }
}
```

Run automatically when using `npm run dev` in `/src/theme` folder

- [Azure Function Node Reference](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-node?tabs=v2#context-object)
- [BigCommerce Product Options](https://support.bigcommerce.com/s/article/Product-Options-v3)
- This is what is used to get all products: [api reference](https://developer.bigcommerce.com/api-reference/store-management/catalog/products/getproducts)
