# CareCache website infrastructure

This deployment unit owns `carecache-prod-rg-01` and the Free-tier
`carecache-prod-swa-01` Azure Static Web App. DNS remains out of scope until a custom domain is
selected.

Bootstrap the resource group once with an Azure identity that can deploy at subscription scope:

```sh
az deployment sub what-if --location centralus --template-file infra/site/bootstrap.bicep
az deployment sub create --location centralus --template-file infra/site/bootstrap.bicep
```

Then configure a passwordless GitHub OIDC identity scoped to the site resource group and add its
client, tenant, and subscription identifiers to the `site-production` GitHub environment. Set:

- secrets: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`
- variables: `AZURE_SITE_DEPLOY_ENABLED=true`, `CARECACHE_SITE_URL=<canonical https URL>`

The workflow reads the Static Web App deployment token from Azure after OIDC login; no Azure client
secret or long-lived deployment token is stored in GitHub.
