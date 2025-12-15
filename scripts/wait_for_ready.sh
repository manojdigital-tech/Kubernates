#!/usr/bin/env bash
set -euo pipefail
NS="${1:-default}"
TIMEOUT="${2:-600}"
echo "Waiting for namespace '$NS' pods to be Ready (timeout ${TIMEOUT}s)..."
end=$((SECONDS + TIMEOUT))
while [ $SECONDS -lt $end ]; do
  not_ready=$(kubectl get pods -n "$NS" --no-headers 2>/dev/null | awk '$3 != "Running" && $3 != "Completed" {print $1}' | wc -l)
  if [ "$not_ready" -eq 0 ]; then
    echo "All pods in '$NS' are Ready."
    exit 0
  fi
  kubectl get pods -n "$NS"
  sleep 10
done
