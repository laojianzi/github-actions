# Test Action

# github-actions

This actions assist with uploading report to [covergates.com](https://covergates.com)

## Inputs

### `report-id`

**Required** The covergates report id for your repository

### `report-type`

**Required** The coverage report type, for example `go`, `perl` or etc.

### `report-file`

**Required** The coverage report path. Default `./`

### `pull-request`

Whether to leave a comment if it is a pull_request event
