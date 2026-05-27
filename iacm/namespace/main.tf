# EPROD Namespace Workspace Template
# This Terraform/OpenTofu config provisions a Kubernetes namespace
# Used by the EPROD Environment Blueprint via IaCM

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

variable "name" {
  description = "Namespace name to create"
  type        = string
}

variable "resource_quota_cpu" {
  description = "CPU request quota"
  type        = string
  default     = "4"
}

variable "resource_quota_memory" {
  description = "Memory request quota"
  type        = string
  default     = "8Gi"
}

variable "max_pods" {
  description = "Maximum number of pods"
  type        = number
  default     = 20
}

resource "kubernetes_namespace" "eprod" {
  metadata {
    name = var.name
    labels = {
      "app.kubernetes.io/managed-by" = "harness-idp"
      "eprod.harness.io/environment" = "true"
      "name"                         = var.name
    }
    annotations = {
      "harness.io/created-by" = "eprod-environment-management"
    }
  }
}

resource "kubernetes_resource_quota" "eprod" {
  metadata {
    name      = "eprod-quota"
    namespace = kubernetes_namespace.eprod.metadata[0].name
  }

  spec {
    hard = {
      "requests.cpu"    = var.resource_quota_cpu
      "requests.memory" = var.resource_quota_memory
      "limits.cpu"      = "8"
      "limits.memory"   = "16Gi"
      "pods"            = var.max_pods
    }
  }
}

resource "kubernetes_network_policy" "default_deny" {
  metadata {
    name      = "eprod-default-deny-external"
    namespace = kubernetes_namespace.eprod.metadata[0].name
  }

  spec {
    pod_selector {}
    policy_types = ["Ingress"]

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.name
          }
        }
      }
    }
  }
}

output "name" {
  value       = kubernetes_namespace.eprod.metadata[0].name
  description = "The created namespace name"
}

output "uid" {
  value       = kubernetes_namespace.eprod.metadata[0].uid
  description = "The namespace UID"
}
