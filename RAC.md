Root Cause Analysis (RCA)
Overview

This RCA summarizes the issues found in the Terraform Docker assignment and the corrective actions taken to ensure stable, secure, and idempotent infrastructure. 
Root Cause Analysis.pdf

Issues & Fixes

1. Non-idempotent Terraform

Cause: timestamp() generated a new value on every run.

Fix: Removed timestamp() from the configuration.

Result: Re-running terraform apply shows No changes. 


2. Container Communication

Cause: Docker containers were not on a shared network.

Fix: Created assignment-net and connected both web and app containers.

Result: Containers communicate successfully using Docker networking. 


3. Security Improvements

Removed hardcoded secrets and passwords.

Used a dedicated Docker network.

Avoided unnecessary dynamic values. 


Validation

Executed:

terraform fmt
terraform init
terraform validate
terraform plan
terraform apply

Verified with docker ps, docker network inspect, and curl http://localhost:8080. 


Final Outcome

Terraform is idempotent.

Docker network created successfully.

Both containers communicate correctly.

Nginx is accessible on localhost:8080.

No hardcoded secrets remain. 

Note :  Please checkout attahed screenshot folder.
