#  HIPAA-Compliant Healthcare Platform on AWS using Terraform

## Project Overview

This project demonstrates the design, deployment, and automation of a secure healthcare platform on AWS using Terraform Infrastructure as Code (IaC).

The objective was to build a cloud environment that aligns with security best practices for handling sensitive healthcare data by implementing identity and access management, encryption, network isolation, audit logging, monitoring, and disaster recovery.

Rather than simply deploying infrastructure, this project focuses on designing a security-first architecture that demonstrates the skills expected of a Cloud Security Engineer or IAM Engineer.

---

# Objectives

* Design a secure AWS environment using Infrastructure as Code.
* Apply security controls appropriate for a regulated healthcare workload.
* Protect sensitive healthcare data using encryption and least privilege access.
* Automate infrastructure deployment using Terraform.
* Demonstrate cloud security architecture and operational best practices.

---

# Architecture

```
                     Internet
                         │
                         ▼
            Application Load Balancer
                         │
                         ▼
              EC2 Application Server
                 (Private Subnet)
                         │
                         ▼
              Amazon RDS PostgreSQL
                 (Private Subnet)


Security Services

• IAM Roles & Policies
• AWS KMS
• AWS Secrets Manager
• Amazon S3
• AWS CloudTrail
• AWS Config
• Amazon CloudWatch
• AWS Backup
```

---

# AWS Services Used

## Compute

* Amazon EC2

## Networking

* Amazon VPC
* Public & Private Subnets
* Route Tables
* Internet Gateway
* Security Groups
* Application Load Balancer

## Storage

* Amazon S3

## Database

* Amazon RDS PostgreSQL

## Identity & Access Management

* AWS IAM
* IAM Roles
* IAM Policies
* IAM Instance Profile

## Security

* AWS KMS
* AWS Secrets Manager
* AWS CloudTrail
* AWS Config

## Monitoring

* Amazon CloudWatch
* Amazon SNS

## Backup

* AWS Backup

---

# Security Controls Implemented

## Identity & Access Management

Implemented IAM Roles and least privilege permissions to eliminate the need for hardcoded AWS credentials.

**Benefit**

* Improved access control
* Temporary credentials
* Easier auditing
* Reduced credential exposure

---

## Network Security

Designed a multi-tier VPC consisting of public and private subnets.

Application servers and databases are isolated from direct internet access.

**Benefit**

* Reduced attack surface
* Improved network segmentation
* Secure communication between application and database

---

## Encryption

Protected sensitive data using AWS KMS.

Encryption is applied to:

* Amazon RDS
* Amazon S3
* AWS Secrets Manager

**Benefit**

* Protects data at rest
* Supports compliance requirements
* Centralised encryption management

---

## Secrets Management

Database credentials are securely stored using AWS Secrets Manager instead of embedding passwords within Terraform code.

**Benefit**

* Eliminates plaintext credentials
* Improves security
* Supports enterprise secret management

---

## Secure Storage

Amazon S3 was configured with:

* Public Access Block
* Versioning
* Server-side encryption

**Benefit**

* Prevents accidental public exposure
* Protects historical object versions
* Supports secure document storage

---

## Audit Logging

AWS CloudTrail records all AWS API activity.

**Benefit**

* Security auditing
* Incident investigation
* Compliance reporting

---

## Configuration Monitoring

AWS Config continuously records AWS resource configurations.

**Benefit**

* Configuration visibility
* Compliance monitoring
* Resource tracking

---

## Backup Strategy

AWS Backup protects the database and supports disaster recovery.
**Benefit**
* Data recovery
* Business continuity
* Backup automation

---
# Terraform Project Structure

```
hipaa-healthcare-platform/
├── terraform/
│   ├── provider.tf
│   ├── versions.tf
│   ├── networking.tf
│   ├── security_groups.tf
│   ├── kms.tf
│   ├── s3.tf
│   ├── secrets.tf
│   ├── rds.tf
│   ├── ec2.tf
│   ├── cloudtrail.tf
│   ├── config.tf
│   ├── cloudwatch.tf
│   ├── sns.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── architecture/
├── docs/
└── README.md
```

---

# Challenges Encountered & Solutions

## Challenge 1 – Terraform Resource Dependency

**Issue**

Terraform returned:

```
Reference to undeclared resource
```

**Cause**

A route table association referenced a resource that had not been declared.

**Solution**

Reviewed Terraform resource dependencies and corrected the resource references.

**Lesson Learned**

Infrastructure resources must be created in the correct order, and references must accurately reflect declared resources.

---

## Challenge 2 – Subnet CIDR Conflict

**Issue**

```
InvalidSubnet.Conflict
```

**Cause**

A subnet CIDR overlapped with an existing subnet.

**Solution**

Redesigned the VPC CIDR allocation to ensure unique subnet ranges.

**Lesson Learned**

Proper IP addressing and network planning are critical before deployment.

---

## Challenge 3 – Duplicate Terraform Data Source

**Issue**

```
Duplicate aws_caller_identity configuration
```

**Cause**

The same Terraform data source was declared in multiple files.

**Solution**

Created a single shared data source and referenced it throughout the project.

**Lesson Learned**

Reusable components reduce duplication and simplify maintenance.

---

## Challenge 4 – Terraform State Lock

**Issue**

Terraform was unable to access the state file because it was locked.

**Solution**

Identified the locking process, released the state lock, and resumed deployment.

**Lesson Learned**

Terraform state management is essential for maintaining deployment consistency.

---

## Challenge 5 – AWS Service Limitations

**Issue**

AWS Security Hub and GuardDuty could not be provisioned because of account/service subscription restrictions.

**Solution**

Removed those services from the deployment while retaining the core security architecture.

**Lesson Learned**

Enterprise engineers must understand cloud service prerequisites and adapt designs based on account constraints without compromising core security objectives.

---

## Challenge 6 – Amazon RDS Free Tier Restriction

**Issue**

Amazon RDS deployment failed because the configured backup retention exceeded the Free Tier limit.

**Solution**

Updated the database configuration to meet Free Tier requirements while maintaining a working deployment.

**Lesson Learned**

Cloud engineers should understand service pricing and account limitations when designing environments.

---

# Deployment Steps

Initialise Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Format Terraform files:

```bash
terraform fmt
```

Review the execution plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Destroy the environment:

```bash
terraform destroy
```

---

# Key Skills Demonstrated

* AWS Cloud Security
* Terraform Infrastructure as Code
* Identity & Access Management (IAM)
* Secure VPC Architecture
* Least Privilege Access Control
* Encryption with AWS KMS
* Secrets Management
* Cloud Audit Logging
* Configuration Compliance
* Infrastructure Automation
* Security Troubleshooting
* Disaster Recovery Planning

---

# Outcomes

This project demonstrates my ability to:

* Design secure cloud architectures on AWS.
* Automate infrastructure using Terraform.
* Implement practical cloud security controls.
* Troubleshoot Terraform and AWS deployment issues.
* Apply security best practices for regulated workloads.
* Document engineering decisions and deployment processes.

The project reflects the type of security-focused infrastructure engineering required for Cloud Security Engineer, IAM Engineer, and DevSecOps roles.

