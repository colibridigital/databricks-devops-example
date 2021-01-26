#!/bin/bash

SUBDIR=$1
if [[ -z "$SUBDIR" ]]
then
    echo 'A subdirectory name must be passed as parameter'
    exit 1
fi

cd ..

echo "Importing workspace /Shared/$SUBDIR/"
databricks workspace import_dir workspace /Shared/$SUBDIR/ --overwrite 

echo "Deploying databricks job"
SETTINGS_JSON=$(cat workspace/databricks_job_config.json)
JOB_ID=$(databricks jobs create --json "$SETTINGS_JSON" | jq .job_id)

echo "Deployment complete, executing job"
databricks jobs run-now --job-id $JOB_ID