# Terraform Depends On

This repo is intended to demonstrate a possible undocumented bug-fix/regression in Terraform 1.2.0 when using `depends_on` with modules that include `provider` blocks.

## Terraform 1.1.9

```
➜ asdf local terraform 1.1.9

➜ terraform init
...snip...

Terraform has been successfully initialized!
...snip...

➜ terraform validate
Success! The configuration is valid.
```

## Terraform 1.2.0

```
➜ asdf local terraform 1.2.0

➜ terraform init
Initializing modules...
- meta in modules/meta
- with in modules/with-provider
- without in modules/without-provider
There are some problems with the configuration, described below.

The Terraform configuration must be valid before initialization so that
Terraform can determine which modules and providers need to be installed.
╷
│ Error: Module is incompatible with count, for_each, and depends_on
│ 
│   on main.tf line 13, in module "meta":
│   13:     module.with,
│ 
│ The module at module.with is a legacy module which contains its own local provider configurations, and so calls to it may not use the count, for_each, or depends_on arguments.
│ 
│ If you also control the module "./modules/with-provider", consider updating this module to instead expect provider configurations to be passed by its caller.
╵
```
