#!/bin/bash

# Function app and storage account names must be unique.
storageName=mystorageaccount$RANDOM
functionAppName=myserverlessfunc$RANDOM
region=westeurope
pythonVersion=3.6 #3.7 also supported

# Create a resource group.
az group create --name az303group --location $region

# Create an Azure storage account in the resource group.
az storage account create \
  --name $storageName \
  --location $region \
  --resource-group az303group \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name $functionAppName \
  --storage-account $storageName \
  --consumption-plan-location $region \
  --resource-group az303group \
  --os-type Linux \
  --runtime python \
  --runtime-version $pythonVersion \
  --functions-version 2
