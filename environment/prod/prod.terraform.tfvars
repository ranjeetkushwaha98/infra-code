
rg-map = {
  rg1 = {
    rg_name  = "prod-todoapp-rg"
    location = "West Europe"
  }
}

acr-map = {
  acr1 = {
    acr_name = "prodacrdemo321"
    rg_name  = "todoapp-rg"
    location = "West Europe"
  }
}

aks-map = {
  aks1 = {
    aks_name = "prod-demoaks321"
    location = "West Europe"
    rg_name  = "todoapp-rg"
    tags = {
      env   = "prod"
      owner = "todoapp"
    }
    node_pool = {
      pool1 = {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2_v2"
      }
    }
  }
}
sqlserver-map = {
  sqlserver1 = {
    sqlserver_name      = "prod-sqlserverdemo321"
    rg_name             = "prod-todoapp-rg"
    location            = "West Europe"
    admin_login         = "adminuser"
    admin_password      = "admin@12345678"
    azuread_admin_login = ""
    azuread_object_id   = ""
    tags = {
      env   = "prod"
      owner = "todoapp"
    }
  }
}
sqldb-map = {
  sqldb1 = {
    sqldb_name     = "prod-sqldbdemo321"
    sqlserver_name = "prod-sqlserverdemo321"
    rg_name        = "prod-todoapp-rg"
    tags = {
      env   = "prod"
      owner = "todoapp"
    }
  }
}
storage-map = {
  storage1 = {
    storage_name = "todoappstorage321"
    rg_name      = "prod-todoapp-rg"
    location     = "West Europe"
    tags = {
      env   = "prod"
      owner = "todoapp"
    }
  }

}

