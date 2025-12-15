
# One-Click: Kubernetes + Dynatrace + OpenTelemetry (Sock Shop)

## Prerequisites
- Dynatrace SaaS: Create an **API token** with required scopes, note your **environment ID**.
- AWS (for EKS): IAM credentials with permission to create EKS clusters, update IAM role trust policies.

## Repo Secrets
- `DT_ENV_ID`, `DT_API_TOKEN`, `DT_INGEST_TOKEN`
- (EKS) `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, optionally `AWS_REGION`

## Run the workflow
1. Push this repo.
2. Go to **Actions → Kubernetes + Dynatrace + OTel (Sock Shop)** → **Run workflow**.
3. Pick `provider`: **eks** (default) or **minikube**.
4. Watch logs; artifacts include applied manifests and kubeconfig.

## Notes
- Minikube runs inside the GitHub runner using Docker driver. [12](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html)
- EKS role trust policy includes `sts:TagSession` for Auto Mode compatibility. [3](https://gremlin.awsworkshop.io/34_setup_sockshop_gremlin/20_deploy_sockshop.html)
- Dynatrace Operator via Helm + DynaKube CR enables K8s + auto-injection. [9](https://docs.aws.amazon.com/eks/latest/userguide/auto-enable-existing.html)[10](https://dev.to/aws-builders/assign-an-iam-role-to-a-kubernetes-service-account-3nc7)
- OTel Collector exports telemetry via OTLP/HTTP to Dynatrace `/api/v2/otlp`. [1](https://knowledge.businesscompassllc.com/build-configure-deploy-full-eks-cluster-creation-tutorial-with-eksctl/)
- Sock Shop is an archived demo; manifests remain available; fallback fork provided. [7](https://dynatrace.awsworkshop.io/90_aws-lab6/5_dynatrace_operator_installation_walk-through.html)[8](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
