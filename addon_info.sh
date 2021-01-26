#!/bin/bash
#
# Extracts information from a CCP created kubenetes cluster about installed add-ons.
# Extracts the Kubenetes Dashboard Token for use in accessing the dashboard GUI.
# Extracts the Grafana login and password for accessing the Grafana (Monitoring) GUI.
#
# Requires kubectl be installed.

# Make sure the user passed us the kubeconfig file
if [ "$1" == "" ] || [ $# -gt 1 ]; then
echo "Please pass us the kubeconfig.yaml file."
echo "Example $0 demo1-kubeconfig.yaml"
exit 0
fi

# Gather information for Kubernetes Dashboard
DSECRET=`kubectl get secrets -n kube-system --kubeconfig=$1 | grep default | awk '{print $1}'`
# echo "$DSECRET"
DTOKEN=`kubectl describe secret $DSECRET -n kube-system --kubeconfig=$1 | grep token: | awk '{print $2}'`
# Print information for Kubernetes Dashboard
echo ""
echo "==Kubernetes Dashboard=="
echo "Token: $DTOKEN"

# Gather information for Grafana
GSECRET=`kubectl get secrets/ccp-monitor-grafana -n ccp -o yaml --kubeconfig=$1`
GUSERNAME=`echo $GSECRET | grep admin-password: | awk '{print $7}' | base64 -D`
GTOKEN=`echo $GSECRET | grep admin-password: | awk '{print $5}' | base64 -D`
# Print information for Grafana
echo ""
echo "==Grafana=="
echo "Username: $GUSERNAME"
echo "Password: $GTOKEN"
