# Vault Guard Project

Welcome to the **Vault Guard** project!  
This project demonstrates how to **deploy a Node.js application on an EKS (Elastic Kubernetes Service) cluster** using **modern DevOps and DevSecOps tools, techniques, and best practices**.

---

## 🛠️ Tools & Services Used

| Category         | Tools / Services                                                                                                 |
|------------------|------------------------------------------------------------------------------------------------------------------|
| **Version Control** | ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)          |
| **CI/CD**           | ![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white)        |
| **Code Quality**    | ![SonarQube](https://img.shields.io/badge/SonarQube-4E9BCD?style=flat-square&logo=sonarqube&logoColor=white)  |
| **Containerization**| ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)           |
| **Orchestration**   | ![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white) |
| **Monitoring**      | ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white) ![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white) |
| **Security**        | ![OWASP](https://img.shields.io/badge/OWASP-000000?style=flat-square&logo=owasp&logoColor=white) ![Trivy](https://img.shields.io/badge/Trivy-00979D?style=flat-square&logo=trivy&logoColor=white) |
| **IaC**             | ![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat-square&logo=terraform&logoColor=white)  |

---

## 🚦 Project Stages

1. **Phase 1: Deployment to Docker Container**
    - Containerize the application using Docker.
    - Build & push Docker images to a container registry.
    - Run the application in a Docker container.

2. **Phase 2: Deployment to EKS Cluster with Monitoring**
    - Deploy the application to an **Amazon EKS** cluster.
    - Set up **Prometheus** and **Grafana** for monitoring.
    - Use **Trivy** and **OWASP** for vulnerability scanning and security best practices.

---

## 📂 Code Repository

- [GitHub Repo](https://github.com/YashPatil1678/VaultGuard_Project.git)
- Clone:
  
```bash
git clone https://github.com/YashPatil1678/VaultGuard_Project.git
```

---

## 🔓 Ports To Enable In Security Group

| Service        | Port   |
|----------------|--------|
| HTTP           | 80     |
| HTTPS          | 443    |
| SMTPS          | 465    |
| TCP            | 587    |
| SSH            | 22     |
| Jenkins        | 8080   |
| SonarQube      | 9000   |
| Prometheus     | 9090   |
| Node Exporter  | 9100   |
| Grafana        | 3000   |
| TCP (API)      | 4954   |
| TCP            | 4173   |
| TCP (App)      | 5173   |

---

## 📝 Prerequisites

- Ubuntu/Debian OS
- `sudo` privileges

---

## 🚀 Installation Steps

### 1. **System Update & Common Packages**
```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y bash-completion wget git zip unzip curl jq net-tools build-essential ca-certificates apt-transport-https gnupg fontconfig
source /etc/bash_completion
```



### 2. **Install Latest Git**

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y
```

### 3. **Java**
Choose OpenJDK 17 or 21:
```bash
sudo apt install -y openjdk-17-jdk # or openjdk-21-jdk
java --version
```


### 4. **Jenkins**
[Official Jenkins Documentation](https://www.jenkins.io/doc/book/installing/linux/)  
Install and start Jenkins:

```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install -y jenkins
sudo systemctl enable --now jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Access Jenkins at http://your-server-ip:8080


### 5. **Docker**
[Docker Install Guide](https://docs.docker.com/engine/install/ubuntu/)

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
newgrp docker
docker ps
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo systemctl status docker
```

### 6. **Trivy (Vulnerability Scanner)**
[Trivy Docs](https://trivy.dev/v0.65/getting-started/installation/)

```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install -y trivy
trivy --version
```

### 7. **Prometheus & Node Exporter**
- [Prometheus Download](https://prometheus.io/download/)
- [Node Exporter Docs](https://prometheus.io/docs/guides/node-exporter/)

*Prometheus systemd and set up steps omitted for brevity—see full guide in repo or above.*

### 8. **Grafana**
[Grafana Docs](https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/)

```bash
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
sudo systemctl daemon-reload
sudo systemctl enable --now grafana-server
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

---

## 📊 Grafana Dashboards

- Node Exporter: **1860** ([Docs](https://grafana.com/grafana/dashboards/1860-node-exporter-full/))
- Jenkins: **9964** ([Docs](https://grafana.com/grafana/dashboards/9964-jenkins-performance-and-health-overview/))
- Kubernetes: **18283** ([Docs](https://grafana.com/grafana/dashboards/18283-kubernetes-dashboard/))

---

## 🔌 Jenkins Plugins to Install

- Eclipse Temurin Installer Plugin
- NodeJS
- Email Extension Plugin
- OWASP Dependency-Check Plugin
- Pipeline: Stage View Plugin
- SonarQube Scanner for Jenkins
- Prometheus metrics plugin
- Docker API, Commons, Pipeline, plugin, and build-step
- Kubernetes API, Credentials

---

## 🔑 Jenkins Credentials to Store

| Purpose     | ID         | Type          | Notes                      |
|-------------|------------|---------------|----------------------------|
| Email       | mail-cred  | Username/pass |                            |
| SonarQube   | sonar-token| Secret text   | from SonarQube app         |
| Docker Hub  | docker-cred| Secret text   | from Docker profile        |
| AWS Cred    | aws-ID     | Secret text   | Access Key ID              |
| AWS Cred    | aws-Key    | Secret text   | Secret Access Key          |

---

## 🐳 SonarQube Docker Container Run

```bash
docker run -d --name sonarqube
-p 9000:9000
-v sonarqube_data:/opt/sonarqube/data
-v sonarqube_logs:/opt/sonarqube/logs
-v sonarqube_extensions:/opt/sonarqube/extensions
sonarqube:lts-community
```

---

## ⚙️ Jenkins Tools Configuration

- JDK
- SonarQube Scanner installations (`sonar-scanner`)
- Node
- Dependency-Check (`dp-check`)
- Docker

---

## 📧 Jenkins System Configuration

- SonarQube Server:  
  - Name: `sonar-server`  
  - URL: `http://<sonarqube-ip>:9000`
- Extended Email Notification:  
  - SMTP server: `smtp.gmail.com` (SSL/465)
- E-mail Notification:  
  - SMTP server: `smtp.gmail.com` (TLS/587),  
  - SMTP Auth: Yes  
  - User: example@gmail.com

---

## ☸️ EKS Kubernetes Setup Guide

### 1. **AWS CLI**
[Official Docs](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```bash
sudo apt install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
Configure:
```bash
aws configure
```

### 2. **kubectl**
[Install Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl bash-completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'alias k=kubectl' >> ~/.bashrc
echo 'complete -F __start_kubectl k' >> ~/.bashrc
source ~/.bashrc
```


### 3. **eksctl**
[Install Guide](https://eksctl.io/installation/)

```bash
ARCH=amd64
PLATFORM=$(uname -s)$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
sudo apt-get install -y bash-completion
echo 'source <(eksctl completion bash)' >> ~/.bashrc
echo 'alias e=eksctl' >> ~/.bashrc
echo 'complete -F __start_eksctl e' >> ~/.bashrc
source ~/.bashrc
```


### 4. **Create EKS Cluster and Nodegroup**

```bash
eksctl create cluster \
  --name my-cluster \
  --region ap-south-1 \
  --version 1.33 \
  --without-nodegroup

eksctl create nodegroup \
  --cluster my-cluster \
  --name my-nodes-ng \
  --nodes 2 \
  --nodes-min 2 \
  --nodes-max 6 \
  --node-type t3.medium

```

### 5. **Update kubeconfig**

```bash
aws eks update-kubeconfig --name my-cluster --region ap-south-1
```


---

*Happy DevSecOps-ing!*
