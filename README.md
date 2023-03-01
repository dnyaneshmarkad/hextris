# Automation of Hextris Deployment on Kubernetes Cluster
This project helps in deploying hextris(puzzled game - https://github.com/Hextris/hextris) on kubernetes cluster created using Terraform. This project uses Terraform for infrastructure provisioning, helm for deployment of application. 

**Contents**
1. Terraform code for creating kubernetes cluster
2. Hextris app code and Dockerfile for building docker image
3. Helm chart for deployment of application on kubernetes cluster

**Create Kubernetes Cluster using Terraform**
*Prerequisites*
- Ubuntu 20.04 Virtual machine with below software installed
  - Docker
  - terraform
  - Kind
  - kubectl 
- Clone this repository on the target Virtual machine

*Execution*
- Navigate to terraform directory in the cloned repo
- $ terraform init
- $ terraform plan
- $ terraform apply

The above commands will create a kind kubernetes cluster with single control-plane and 3 worked node cluster. The cluster details can be featched using kind utility.
Kubectl can be used to interact with the cluster.

**Build docker image**

Developed the Dockerfile which uses nginx:stable-alpine as base image.
- Navigate to hextris-app directory in the repository cloned and run below
- $ docker build -t hextris .
- $ docker tag hextris dnyaneshmarkad/hextris
- $ docker push dnyaneshmarkad/hextris

**Deploy hextris application on K8S**
To deploy the hextris app docker image on kubernetes cluster, helm chart is developed. Follow below steps to deploy 
- Navigate to helm-chart directory
- $ helm install hextris-1.0 hextris/ --values hextris/values.yaml --namespace hextris-ns

The application is deployed on kubernetes cluster. Run below commands to access the application
- $ kubectl get deploy
- $ kubectl port-forward deployment/hextris-chart 8081:80 -n hextris-ns

Open browser on virtual machine, the game is ready to play on http://localhost:8081

