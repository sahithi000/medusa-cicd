# Medusa Terraform CI/CD Project

This project demonstrates deploying the Medusa headless commerce backend on AWS ECS Fargate using Terraform.  
A GitHub Actions workflow automatically applies the Terraform configuration on each push to the main branch.

## 💡 Stack Used
- Terraform
- AWS ECS with Fargate
- GitHub Actions CI/CD
- Docker image: `medusajs/medusa`

## 🚀 What It Does
- Creates ECS Cluster and Service
- Defines Fargate-compatible Task with Medusa container
- Uses CI/CD to auto-deploy on git push

