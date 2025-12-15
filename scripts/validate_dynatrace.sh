
#!/usr/bin/env bash
set -euo pipefail
DT_ENV_ID="$1"
DT_API_TOKEN="$2"
BASE="https://${DT_ENV_ID}.live.dynatrace.com/api"
# Example: query a Kubernetes builtin metric
curl -fsSL -H "Authorization: Api-Token ${DT_API_TOKEN}" \
  "${BASE}/v2/metrics/query?metricSelector=builtin%3Akubernetes.cpu.usage" \
