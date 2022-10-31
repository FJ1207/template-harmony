provider "harmony" {
  # Configuration options
  username = var.username
  password = var.password
  endpoint = var.endpoint
}

# 创建租户
resource "harmony_tenants" "test" {
  alias_name  = var.tenants_alias_name
  tenant_name = var.tenants_tenant_name
  //基本类型列表
  tm_list     = var.tenants_tm_list
}

# 在租户下配额
resource "harmony_quotas" "test" {
  tenant_id      = harmony_tenants.test.id
  node_pool_name = var.quotas_node_pool_name
  cluster_id     = var.quotas_cluster_id
  cpu            = var.quotas_cpu
  memory         = var.quotas_memory
}

# 创建项目
resource "harmony_project" "test" {
  tenant_id    = harmony_tenants.test.id
  alias_name   = var.project_alias_name
  project_name = var.project_name
  annotation   = var.project_annotation
  pm_list =  var.project_pm_list

  dynamic "project_registries" {
    for_each = var.project_registries
    iterator = registries
    content {
      registry_id = lookup(registries.value, "registry_id", "")
      nickname    = lookup(registries.value, "nickname", "")
      username    = lookup(registries.value, "username", "")
      password    = lookup(registries.value, "password", "")
    }
  }
  //ns_list = []
  //namespace_list = []
  //harbor 66挂了
  #  project_registries{
  #    registry_id = "c98d95ea79b14d1f"
  #    nickname = "harbor194"
  #    username = "lianb-xm-ja2iaf"
  #    password = "eogio7rT"
  #  }
}

# 项目下绑定命名空间
resource "harmony_namespace" "test" {
  name           = var.namespace_name
  alias_name     = var.namespace_alias_name
  tenant_id      = harmony_tenants.test.id
  data_center    = var.namespace_data_center
  cluster_id     = harmony_quotas.test.tenant_id
  node_pool_name = harmony_quotas.test.node_pool_name
  cpu            = var.namespace_cpu
  memory         = var.namespace_memory
}