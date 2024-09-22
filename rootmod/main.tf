module "instance" {
  source = "./modules/instance"
  amid = var.amid
  type = var.type
}
