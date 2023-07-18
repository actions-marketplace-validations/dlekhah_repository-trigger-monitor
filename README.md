# Repository Dispatch Trigger

This GitHub Action triggers a workflow and monitors its progress.

## Inputs

| Name                | Description                         | Required | Default |
|---------------------|-------------------------------------|----------|---------|
| `github_token`      | GitHub token for authentication.    | true     | -       |
| `event`             | Event type to trigger the workflow. | true     | -       |
| `owner`             | Repository owner.                   | true     | -       |
| `repo`              | Repository name.                    | true     | -       |
| `payload`           | Payload content.                    | false    | '{}'    |
| `status_refresh_time` | Status update refresh time.        | false    | 10      |

The following table provides information about the inputs for this action:

- `github_token`: A GitHub token used for authentication. It is required for accessing the GitHub API.
- `event`: The event type that triggers the workflow. This can be any valid event type recognized by the GitHub API.
- `owner`: The owner of the repository where the workflow will be triggered.
- `repo`: The name of the repository where the workflow will be triggered.
- `payload`: The content of the payload to be sent along with the workflow trigger. This is an optional input, and the default value is an empty JSON object (`{}`).
- `status_refresh_time`: The time interval (in seconds) for refreshing the status update of the triggered workflow. This is an optional input, and the default value is 10 seconds.

Make sure to replace your-username, your-event-type, your-repository-owner, and your-repository-name with the appropriate values for your repository and workflow. Instead of using the default secrets.GITHUB_TOKEN, you can use a Personal Access Token (PAT) by storing it as a secret named PAT_TOKEN in your repository's settings and referencing it in the github_token input. This allows you to have more control over the permissions and scope of the token used for authentication.
## Usage

To use this action in your workflow, you can include the following step in your workflow file:

```yaml
name: Example Workflow

on:
  push:
    branches:
      - main

jobs:
  trigger-workflow:
    name: Trigger Workflow
    runs-on: ubuntu-latest

    steps:
      - name: Trigger Repository Dispatch
        uses: your-username/repository-dispatch-action@v1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          event: your-event-type
          owner: your-repository-owner
          repo: your-repository-name
          payload: '{"key": "value"}'
          status_refresh_time: 5
```

## Screenshots
![Example - Successful run](./screenshots/success.jpeg)
![Example - Cancelled run](./screenshots/cancelled.jpeg)
