variable "bucket_name" {
    description ="Name of the S3 bucket"
    type = string
    default  ="my-static-website-haneef"
}

variable "bucket_name" {
    description ="Index document for s3 website"
    type = string
    default  ="index.html"
}

variable "website_error" {
    description ="Error document for S3 website"
    type = string
    default  ="error.html"
}