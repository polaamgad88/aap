# OpenShift & Infrastructure Ansible Automation Collection

This repository contains a comprehensive suite of Ansible playbooks designed to automate the end-to-end lifecycle, Day-2 operations, security compliance, and platform management for **Red Hat OpenShift Container Platform (OCP)**, **Red Hat Quay**, and **Red Hat Advanced Cluster Management (ACM)**.

---

## 🛠️ Automated Operations & Scope

### 1. Identity & Access Management (IAM)
* **LDAP Integration:** Automated LDAP secret binding, group/role synchronization, and whitelist rule application.
* **RBAC & Governance:** Automated assignment of cluster-admin privileges to designated user groups (e.g., `DTSG`) and OAuth provider configuration.
* **Security Hardening:** Automated removal of default elevated credentials (`kubeadmin`) and self-provisioning rights to enforce least-privilege access.

### 2. Day-2 Cluster Operations
* **Time Synchronization:** Automated NTP/Chrony daemon deployment across Control Plane and Worker nodes via `MachineConfig`.
* **Certificate & Ingress Management:** Automated API and Route TLS certificate renewals, Ingress profile configurations, and automatic approval of Certificate Signing Requests (CSRs).
* **Maintenance & Capacity Control:** Dynamic timezone updates and precise control of node update strategies via `maxUnavailable` settings across Master, Worker, Infra, and Storage MachineConfigPools (MCPs).

### 3. Storage Infrastructure (ODF & LSO)
* **Local Storage Operator (LSO):** Automated deployment, local volume discovery, and local volume set creation.
* **OpenShift Data Foundation (ODF):** Automated installation of ODF, StorageCluster resource definition, and node disk configurations.
* **Node Isolation:** Automated creation of storage-specific MachineConfigPools and application of node taints for dedicated storage workloads.

### 4. Network Configuration
* **NMState Operator:** End-to-end automation of the NMState operator subscription, instance creation, and node network state definitions.
* **Traffic & Egress Management:** Global proxy configuration, custom Ingress controller node selection, and OVN Egress IP orchestration.

### 5. Node Lifecycle & Compute Management
* **Node Orchestration:** Programmatically label and taint nodes based on roles (Infra, Storage, CPU topologies).
* **Multi-Cluster Namespace Management:** Automated workspace creation across cluster sets and scheduled cleanup of transient debug namespaces.
* **CoreOS Provisioning:** Automated deployment and baseline provisioning of Red Hat Enterprise Linux CoreOS (RHCOS) virtual machines.

### 6. Container Registry Management (Red Hat Quay)
* **Organization & Access Setup:** Automated creation of Quay organizations, teams, robot accounts, and authentication secrets.
* **Registry Governance:** Programmatic management of permissions, proxy caching, storage quota allocation, and image pruning policies.

### 7. Observability, Backup & Multi-Cluster Governance
* **Health & Compliance Auditing:** Automated API health checks, cluster health reports, and vulnerability extraction across managed clusters.
* **Multi-Cluster Management (ACM):** Automated cluster onboard and import workflows for Red Hat Advanced Cluster Management (ACM) and PaaS Hub environments.
* **Diagnostic Data Extraction:** Automated full YAML configuration backups and direct offloading of `must-gather` diagnostic packages to S3 object storage.

---

## 📋 Technology Stack & Domain Coverage

* **Orchestration:** Ansible Automation Platform / Ansible Engine
* **Container Platform:** Red Hat OpenShift Container Platform (OCP) 4.x
* **Storage Operators:** OpenShift Data Foundation (ODF), Local Storage Operator (LSO)
* **Networking Operators:** Kubernetes NMState Operator, OVN-Kubernetes
* **Registry & ACM:** Red Hat Quay, Red Hat Advanced Cluster Management (ACM)
