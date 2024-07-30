# Multi-Microservice CI/CD Pipeline with Azure DevOps and AKS

![Architecture diagram](voting%20application%20deployment%20part.png)

The project is focused on creating CI/CD pipelines for a multi-microservice application using Azure DevOps. The application, developed by the Docker team, was sourced from their GitHub repository. This initiative encompassed setting up essential infrastructure components and ensuring seamless integration and deployment processes.

# Project Overview
Successfully implemented a CI/CD pipeline using Azure DevOps for a multi-microservice Voting Application.
The application consists of the following microservices:

- **Vote** (Python)
- **Result** (Node.js)
- **Worker** (.NET)
- **Redis**
- **Database**

# Architecture

![Architecture diagram](architecture.excalidraw.png)

* A front-end web app in [Python](/vote) which lets you vote between two options
* A [Redis](https://hub.docker.com/_/redis/) which collects new votes
* A [.NET](/worker/) worker which consumes votes and stores them in…
* A [Postgres](https://hub.docker.com/_/postgres/) database backed by a Docker volume
* A [Node.js](/result) web app which shows the results of the voting in real time

## Notes

The voting application only accepts one vote per client browser. It does not register additional votes if a vote has already been submitted from a client.

This isn't an example of a properly architected perfectly designed distributed app... it's just a simple
example of the various types of pieces and languages you might see (queues, persistent data, etc), and how to
deal with them in Docker at a basic level.

## Steps and Process

### 1. Source Code Migration
**Task:**
- Imported the voting app repository from the Docker team's GitHub into Azure DevOps Repos.

### 2. Resource Provisioning
**Actions:**
- Created a resource group in the Azure portal to manage all related resources.
- Set up Azure Container Registry (ACR) to store Docker images.

### 3. Agent Pool Configuration
**Steps:**
- Created Azure Virtual Machines (VMs) to act as agents.
- Added the VMs to the Azure DevOps agent pool.
- Connected the VMs to Azure DevOps for pipeline execution.

### 4. Pipeline Development
**Implementation:**
- Developed CI/CD pipelines for three microservices: Vote, Result, and Worker.
- Configured pipelines to utilize the added agents for building and deploying the application.

### 5. AKS Cluster Creation
**Provisioning:**
- Set up an Azure Kubernetes Service (AKS) cluster for container orchestration.
- Installed and configured Argo CD within the AKS cluster for continuous deployment.

### 6. Shell Script Development
**Automation:**
- Created a shell script to update Kubernetes manifests with new image tags in the Azure repository.

### 7. Argo CD Integration
**Configuration:**
- Linked Argo CD to Azure Repos.
- Set up Argo CD to monitor Kubernetes manifests and deploy updates to the AKS cluster.

## Pipeline Stages

Each pipeline is designed with three essential stages:

### Build Stage
**Objective:**
- Build the Docker image for the microservice.

### Push Stage
**Task:**
- Push the Docker image to Azure Container Registry (ACR).

### Update Stage
**Automation:**
- Run a shell script to update Kubernetes manifests with the new image tags.

---

This robust implementation of CI/CD pipelines with Azure DevOps and Azure Cloud services guarantees efficient and automated deployment and management of the Voting Application's microservices. Utilizing Azure Kubernetes Service (AKS) and Argo CD significantly enhances the deployment process, ensuring continuous delivery and operational efficiency.

## Acknowledgments

Special thanks to Abhishek Veeramalla for the detailed course on "Azure Zero to Hero" and guidance throughout the project, and to Aswani Anitha for recommending this channel.

