resource  "aws_s3_bucket" "website_bucket" {
    bucket = var.bucket_name
    acl ="public-read"

website {
    index_document= var.website_index
    error_document= var.website_error

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
                Effect ="Allow"
                Principal = "*" 
                Action = "s3:GetObject"
                Resource = "${aws_s3_bucket.website_bucket.arn}"
            }
        ]
    })
}