
rg-map = {
  rg1 = {
    rg_name  = "dev-todoapp-rg"
    location = "West Europe"
  }
  rg2 = {
    rg_name  = "dev-todoapp-rg2"
    location = "West Europe"
  }
}

acr-map = {
  acr1 = {
    acr_name = "devacrdemo321"
    rg_name  = "todoapp-rg"
    location = "West Europe"
  }
}

aks-map = {
  aks1 = {
    aks_name = "dev-demoaks321"
    location = "West Europe"
    rg_name  = "todoapp-rg"
    tags = {
      env   = "dev"
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
    sqlserver_name      = "dev-sqlserverdemo321"
    rg_name             = "dev-todoapp-rg"
    location            = "West Europe"
    admin_login         = "adminuser"
    admin_password      = "admin@12345678"
    azuread_admin_login = ""
    azuread_object_id   = ""
    tags = {
      env   = "dev"
      owner = "todoapp"
    }
  }
}
sqldb-map = {
  sqldb1 = {
    sqldb_name     = "dev-sqldbdemo321"
    sqlserver_name = "dev-sqlserverdemo321"
    rg_name        = "dev-todoapp-rg"
    tags = {
      env   = "dev"
      owner = "todoapp"
    }
  }
}
storage-map = {
  storage1 = {
    storage_name = "todoappstorage321"
    rg_name      = "dev-todoapp-rg"
    location     = "West Europe"
    tags = {
      env   = "dev"
      owner = "todoapp"
    }
  }

}

