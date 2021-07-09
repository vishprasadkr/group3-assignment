module "resource_group" {
  source = "./modules/resource_group"
  # rg_name    = module.resource_group.rg_name
}

module "common" {
  source = "./modules/common"
  # rg_name = "group3-assignment1-rg"
  rg_name = module.resource_group.rg_name
}

module "database" {
  source  = "./modules/database"
  rg_name = module.resource_group.rg_name
}

module "linux" {
  source   = "./modules/linux"
  rg_name  = module.resource_group.rg_name
  location = "CanadaCentral"
  linux_name = {
    "assignment1-linux-vm1" = "Standard_B1s"
    "assignment1-linux-vm2" = "Standard_B1s"
  }
  subnet_id = module.network.subnet1
}

module "network" {
  source   = "./modules/network"
  rg_name  = module.resource_group.rg_name
  location = "CanadaCentral"
}

module "vmwindows" {
  source    = "./modules/vmwindows"
  windows_name = {
    "win-vm1" = "Standard_B1s"
  }
  subnet_id = module.network.subnet1
  rg_name   = module.resource_group.rg_name
}
