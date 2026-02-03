terraform-modules/
├── modules/                     # Base reusable modules (single source)
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── s3/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── env/
    └── dev/                    # Environment-specific wrappers
        ├── vpc/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.tfvars
        │
        ├── ec2/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.tfvars
        │
        └── s3/
            ├── provider.tf
            ├── variables.tf
            ├── locals.tf
            ├── main.tf
            ├── outputs.tf
            └── dev.tfvars
