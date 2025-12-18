rgs = {
  rg1 = {
    name       = "rg-surjeet"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env   = "dev"
      owner = "surjeet"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-surjeet"
    location            = "centralindia"
    resource_group_name = "rg-surjeet"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    name                = "pip-surjeet"
    resource_group_name = "rg-surjeet"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
  app2 = {
    name                = "pip-simran"
    resource_group_name = "rg-surjeet"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "backend"
      env = "prod"
    }
  }
}

key_vaults = {
  kv1 = {
    kv_name  = "secretvault"
    location = "centralindia"
    rg_name  = "rg-surjeet"
  }
}

vms = {
  vm1 = {
    nic_name       = "nic-frontend-vm-01"
    location       = "centralindia"
    rg_name        = "rg-surjeet"
    vnet_name      = "vnet-surjeet"
    subnet_name    = "frontend-subnet"
    pip_name       = "pip-surjeet"
    vm_name        = "frontend-vm"
    size           = "Standard_F2"
    kv_name        = "secretvault"
    admin_username = "devopsinsider"
    admin_password = "welcome@123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name       = "nic-frontend-vm-02"
    location       = "centralindia"
    rg_name        = "rg-surjeet"
    vnet_name      = "vnet-surjeet"
    subnet_name    = "backend-subnet"
    pip_name       = "pip-simran"
    vm_name        = "backend-vm"
    size           = "Standard_F2"
    kv_name        = "secretvault"
    admin_username = "devopsinsider1"
    admin_password = "welcome@1234"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

sql_server = {
  sql1 = {
    name                         = "sql-dev-31st"
    resource_group_name          = "rg-surjeet"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "devopsadmin"
    administrator_login_password = "P@ssw01rd@123"
    minimum_tls_version          = "1.2"
    tags = {
      owner = "sql admin"
    }
  }

}


sql_db = {
  sql1 = {
    name        = "sqldb-dev"
    max_size_gb = "2"
    tags = {
      owner = "sql admin"
    }

  }
}
