# Loonie Bets Deploy Scripts & Pipline

## Workflows

### PR Workflow

PRs are deployed for review using the following pattern:   
`branchname.project.domain.tld`

### Deploy Workflow

The deploy workflow is exactly the same, except only the lastest tagged build is deployed.

### Tooling
- Github Actions (Code Pipeline)
- Terraform Cloud (Infra Pipeline)
- Docker (Application containers)
- Caddy / Caddy Docker Proxy (HTTPS reverse proxy)

### AWS

The packer directory contains the packer configuration used as the AMI for the EC2 instance we're runnign Loonie-Bets on. The idea here is that we should be able to create, modify, and update everything from within this responsitory. 

