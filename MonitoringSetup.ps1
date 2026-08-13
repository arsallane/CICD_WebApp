$resourceGroup = "rg-demo-1786643905"
$webAppName = "webapp-demo1-1786643905"
az monitor metrics alert create `
    --name "HighCPUAlert" `
    --resource-group $resourceGroup `
    --scopes $(az webapp show --name $webAppName --resource-group $resourceGroup --query id -o tsv) `
    --condition "total CpuTime > 80"`
    --description "CPU usage is high." `
    --window-size 5m `
    --evaluation-frequency 1m

#
#  PS C:\Users\33671\webapplication1> .\MonitoringSetup.ps1
#{
#  "actions": [],
#  "criteria": {
#    "allOf": [
#      {
#        "criterionType": "StaticThresholdCriterion",
#        "metricName": "CpuTime",
#        "name": "cond0",
#        "operator": "GreaterThan",
#        "threshold": 80.0,
#        "timeAggregation": "Total"
#      }
#    ],
#    "odata.type": "Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria"
#  },
#  "description": "CPU usage is high.",
#  "enabled": true,
#  "evaluationFrequency": "PT1M",
#  "id": "/subscriptions/829b119a-d531-4358-ab38-156030b10f4f/resourceGroups/rg-demo-1786643905/providers/Microsoft.Insights/metricAlerts/HighCPUAlert",
#  "location": "global",
#  "name": "HighCPUAlert",
#  "resourceGroup": "rg-demo-1786643905",
#  "scopes": [
#    "/subscriptions/829b119a-d531-4358-ab38-156030b10f4f/resourceGroups/rg-demo-1786643905/providers/Microsoft.Web/sites/webapp-demo1-1786643905"
#  ],
#  "severity": 2,
#  "type": "Microsoft.Insights/metricAlerts",
#  "windowSize": "PT5M"
#}