module "with" {
  source = "./modules/with-provider"
}

module "without" {
  source = "./modules/without-provider"
}

module "meta" {
  source = "./modules/meta"

  depends_on = [
    module.with,
    module.without
  ]
}
