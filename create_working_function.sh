#Based on following tutorial: https://docs.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-python?tabs=azure-cli%2Cbash%2Cbrowser
#az login
az group create --name AzureFunctionsQuickstart-rg --location uksouth
az storage account create --name az303storagejk --location uksouth --resource-group AzureFunctionsQuickstart-rg --sku Standard_LRS
az functionapp create --resource-group AzureFunctionsQuickstart-rg --consumption-plan-location uksouth --runtime python --runtime-version 3.8 --functions-version 3 --name az303appjktest --storage-account az303storagejk --os-type linux
cd functions
func azure functionapp publish az303appjktest
