#!/bin/bash

echo '{"irods_host": "data.cyverse.org", "irods_port": 1247, "irods_user_name": "$IPLANT_USER", "irods_zone_name": "iplant"}' | envsubst > $HOME/.irods/irods_environment.json

exec jupyter lab --no-browser --ip=0.0.0.0 --config=/opt/conda/envs/qiime2-2023.2/etc/jupyter/jupyter_notebook_config.json --ServerApp.token="" --SeverApp.password=""