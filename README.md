# challenge-devops-002
## incrementN DevOps Assignment

This repo provisions two local Docker containers with Terraform. It's broken in a few ways — some will fail terraform apply outright, some will apply "successfully" but leave you with infrastructure that doesn't actually work correctly, or that's unsafe.

Your job:

- Fork this repo in your GitHub account
- Leave the `main` branch as is. Create a new branch from `main` where you will make changes
- Run `terraform init` && `terraform apply` and get it to succeed
- Verify the result is actually correct — the two containers should be able to reach each other, and terraform apply run a second time with no changes should report no changes (idempotent)
- Fix any security/best-practice issues you notice along the way
- Raise a PR to `main`
- Write a short `RCA.md` covering what was wrong, what you changed, why - commit this into the branch as well
- Send back your PR link

AI tools are fine to use. But make sure you understand what code changes you made and why. You are responsible for every change you introduce in a PR. So you should be able to explain each change clearly and confidently.


# Run below command to check connectivity to each other containers. 

# docker run --rm --network assignment-net curlimages/curl curl -v http://web:80
# docker run --rm --network assignment-net curlimages/curl curl -v http://app:80
