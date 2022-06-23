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
- Docker
- Caddy 

