# Selective Builds in GitHub Actions

This guide explains how to optimize your CI/CD pipeline to build and push Docker images **only when relevant files change**. This saves time and resources.

## How It Works

We use the `dorny/paths-filter` action to detect changes in specific directories.

### 1. Define Filters

In your workflow file (e.g., `.github/workflows/docker-build.yml`), define a job to detect changes:

```yaml
jobs:
  detect-changes:
    runs-on: ubuntu-latest
    outputs:
      # Expose the filter results as job outputs
      client: ${{ steps.filter.outputs.client }}
      server: ${{ steps.filter.outputs.server }}
    steps:
      - uses: actions/checkout@v4
      - uses: dorny/paths-filter@v3
        id: filter
        with:
          filters: |
            client:
              - 'development/client/**'
              - '.github/workflows/docker-build.yml'
            server:
              - 'development/server/**'
              - '.github/workflows/docker-build.yml'
```

- **`client` filter**: Matches any change in `development/client/` OR the workflow file itself.
- **`server` filter**: Matches any change in `development/server/` OR the workflow file itself.

### 2. Conditional Jobs

Use the `needs` and `if` keywords to make build jobs dependent on the filter results:

```yaml
  build-client:
    needs: [detect-changes]
    # Only run if the 'client' filter matched changes
    if: needs.detect-changes.outputs.client == 'true'
    steps:
      # ... build steps ...

  build-server:
    needs: [detect-changes]
    # Only run if the 'server' filter matched changes
    if: needs.detect-changes.outputs.server == 'true'
    steps:
      # ... build steps ...
```

## Applying to Other Levels

To use this in Level 2 or 3:

1.  **Copy the Pattern**: Copy the `detect-changes` job structure.
2.  **Update Paths**: Change the paths in the `filters` section to match your new directory structure (e.g., `level-2/client/**`).
3.  **Update Jobs**: Ensure your build jobs `need` the detection job and have the correct `if` condition.

## Benefits

- **Faster Feedback**: You don't wait for the server to build if you only changed the client.
- **Resource Efficiency**: Saves GitHub Actions minutes.
- **Cleaner History**: You only push new image tags when code actually changes.
