 
# Update these values before running
RESOURCE_GROUP="rg-demo-$(date +%s)"
LOCATION="westus"     # Supported for F1 on this subscription
APP_SERVICE_PLAN="appplan" #overrited appèservice_place_demo-$(date +%s)"
WEBAPP_NAME="webapp-demo1-$(date +%s)"
RUNTIME="DOTNETCORE:10.0" # Use a .NET runtime supported in your chosen region
SKU="F1"

# 1) 
echo Create the Resource Group
 

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"


# 2) 
echo Create the App Service Plan
##az appservice plan create \
#  --name "$APP_SERVICE_PLAN" \
#  --resource-group "$RESOURCE_GROUP" \
#  --location "$LOCATION" \
#  --sku "$SKU" \
#  --is-linux

# 3) 
 
echo Create the Web App
az webapp create \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$APP_SERVICE_PLAN" \
  --name "$WEBAPP_NAME" \
  --runtime "$RUNTIME"

echo "Resource Group: $RESOURCE_GROUP"
echo "App Service Plan: $APP_SERVICE_PLAN"
echo "Web App: https://$WEBAPP_NAME.azurewebsites.net"

 
echo "Message final"
read -p "Appuie sur Entrée pour quitter..."
 