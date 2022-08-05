## Sample terraform scripts for GCP 

#### Pre-req

1. Create a service account with the necessary permissions (or for your test env, just make it an editor for testing). If you need to create projects or folders, create this SA at the org level
2. Create a user / or use existing user that can impersonate this SA.

- `https://cloud.google.com/iam/docs/impersonating-service-accounts`

You will need the following permissions on this user
- Service Account Token Creator
- Service Account User
- Workload Identity User
- serviceusage.services.use

3. on machine with gcloud and terraform setup, 
```
gcloud auth application-default login --no-launch-browser
(login as the above user account)
gcloud auth application-default set-quota-project to a project where the above user account was created
```

Refer to `providers.tf` for service account setup

### from scratch , creating projects
```
export TF_VAR_project_name=test-terraform-1
export TF_VAR_project_id=test-terraform-1
```

OR to append the timestamp as a avoid clashing of project id 

```
export TF_VAR_project_id=$TF_VAR_project_name"-"$(date +%s)
```
After creation of project, to make changes in a new session, provide the actual project id (since during creation time a timestamp is used)

export TF_VAR_project_id=[actual project id]

