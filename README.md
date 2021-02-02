# Azure Devops Databricks CI/CD Deployment Example
A very simple example showing you how to create an Azure Devops CI/CD pipeline for Databricks.  Instead of using Azure DevOps built in tasks, we use the newer style YAML pipeline.

In order to run this, make sure you have an Azure DevOps variable group in your Azure Devops Project Library called `databricks_cli`.  This should contain two variables:
* `databricks_host` which is the URL of your databricks workspace
* `databricks_token` which is a personal access token for your databricks workspace

We run two scripts:
* `databricks-cli-config.sh` which installs and configures the jobs databricks cli package
* `databricks-deploy-run.sh` which creates a databricks job containing the config and code in `/workspace` and runs it

## Example
Assumming you have configured the `databricks` cli, running `databricks-deploy-run.sh cicd-example` will:
1. Create a `cicd-example` directory in the Databricks workspace under `Shared`.
2. Populate the same directory with the Databricks Job JSON configuration(`databricks_job_config.json`) and the actual code for the job(`run.py`).
3. Convert `run.py` in a Databricks notebook and then deploy a job.
4. Execute the job.

**Note:** Make sure that the notebook path proeprty in the job JSON configuration matches the path and name of where the code is uplaoded to:
`"notebook_path": "/Shared/cicd-example/run"`
