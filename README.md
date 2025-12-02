
# 🌐 Cool Static Website Hosted on AWS S3 Using Terraform

This project is a modern, responsive **static website** built with **HTML + CSS** and deployed using **Terraform** on an **AWS S3 bucket** configured for static website hosting.

The goal: automate cloud resource creation using **Infrastructure-as-Code (IaC)** instead of manual AWS console steps.

---

## 🚀 Features

### Website
- Gradient background hero section with call-to-action
- Glassmorphism cards
- Fully responsive design
- Modern hover animations

### Infrastructure
- Terraform provisions:
  - AWS S3 bucket
  - Static website hosting configuration
  - Public read access via bucket policy
  - Outputs the S3 website endpoint

---

## 📁 Project Structure

```

/project
│── index.html      # Static website
│── provider.tf     # AWS provider configuration
│── main.tf         # S3 bucket + website config
│── variables.tf    # Configurable variables
│── outputs.tf      # Terraform outputs (website endpoint)
│── README.md       # Documentation

````

---

## 🛠️ Terraform Workflow

1. **Initialize Terraform**
```bash
terraform init
````

2. **Preview resources**

```bash
terraform plan
```

3. **Apply to deploy**

```bash
terraform apply
```

**Example Output**

```
s3_website_endpoint = http://my-cool-site.s3-website-us-east-1.amazonaws.com
```

You can open this URL in your browser to view your website.

---

## 📌 Technologies Used

* Terraform (IaC)
* AWS S3 (Static Website Hosting)
* HTML + CSS (Frontend)

---

## 👤 Author

**Olajobi Haneef** – Cloud Engineer in training
Learning Terraform, AWS, DevOps, and real-world cloud deployments.

#Terraform #AWS #S3 #CloudEngineering #IaC #StaticWebsite #DevOps

````

---

### ✅ Terraform Code Snippet (Simple S3 Host)

`provider.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}
````

`variables.tf`

```hcl
variable "bucket_name" {
  default = "my-cool-static-site-12345"
}
variable "website_index" {
  default = "index.html"
}
variable "website_error" {
  default = "index.html"
}
```

`main.tf`

```hcl
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = var.website_index
    error_document = var.website_error
  }

  tags = {
    Name = "StaticWebsite"
  }
}

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = ["${aws_s3_bucket.website_bucket.arn}/*"]
      }
    ]
  })
}
```

`outputs.tf`

```hcl
output "s3_website_endpoint" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}
```

**Usage**

1. Put your `index.html` in the same folder.
2. Run:

```bash
terraform init
terraform plan
terraform apply
```

3. Terraform outputs your website URL.

---
