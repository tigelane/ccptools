# ccptools
Tools and tips for Cisco Container Platform (ccp)

## Install
Clone it

## Setup
Each of the scripts might need components installed.  I will document the requirements in each script and show a total list here.  Don't install all of this if you just want to run one thing.

* kubectl
    * https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Scripts
1.  `addon_info.sh`

    Extracts information from a CCP created kubenetes cluster about installed add-ons.
    * Extracts the Kubenetes Dashboard Token for use in accessing the dashboard GUI.
    * Extracts the Grafana login and password for accessing the Grafana (Monitoring) GUI.