variable "endpoint" {
  description = "服务地址"
  type        = string
  sensitive   = true
  default     = "http://10.10.101.63"
}

variable "username" {
  description = "用户名"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "password" {
  description = "密码"
  type        = string
  sensitive   = true
  default     = "Ab123456"
}

variable "tenants_alias_name" {
  description = "租户中文名称"
  type        = string
  default     = "yunji_tenant_testaaa"
}

variable "tenants_tenant_name" {
  description = "租户英文名称"
  type        = string
  default     = "yunji-tenant-testaaa"
}

variable "tenants_tm_list" {
  description = "租户管理员"
  type        = list(string)
  default     = ["system","ply"]
}

variable "quotas_node_pool_name" {
  description = "资源池名称"
  type        = string
  default     = "default-pool"
}

variable "quotas_cluster_id" {
  description = "集群ID"
  type        = string
  default     = "test--cluster116"
}

variable "quotas_cpu" {
  description = "quotasCPU核心数"
  type        = string
  default     = "1"
}
variable "quotas_memory" {
  description = "quotas内存"
  type        = string
  default     = "1024"
}

variable "project_alias_name" {
  description = "项目中文名称"
  type        = string
  default     = "yunji_project_aa22"
}

variable "project_name" {
  description = "项目英文名称"
  type        = string
  default     = "yunji-project-aa22"
}

variable "project_annotation" {
  description = "项目备注"
  type        = string
  default     = "11111"
}

variable "project_pm_list" {
  description = "项目管理员"
  type        = list(string)
  default     = ["system","ply"]
}


variable "project_registries" {
  description = "项目策略"
  type        = list(map(any))
  default     = [
    {
      registry_id = "ea1951745f054ce1"
    },
    {
      registry_id = "c98d95ea79b14d1f",
      nickname = "harbor194",
      username = "lianb-xm-ja2iaf",
      password = "eogio7rT"
    },
  ]
}

variable "namespace_name" {
  description = "命名空间名称"
  type        = string
  default     = "yunji-test03-yunji-test-enve"
}

variable "namespace_alias_name" {
  description = "命名空间别名"
  type        = string
  default     = "yunji-test-enve"
}

variable "namespace_data_center" {
  description = "数据中心名称"
  type        = string
  default     = "test"
}

variable "namespace_cpu" {
  description = "命名空间CPU"
  type        = string
  default     = "1"
}

variable "namespace_memory" {
  description = "命名空间内存"
  type        = string
  default     = "1Gi"
}