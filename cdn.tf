# -- Distribution --------------------------------------------------------------

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Manage accesses to the ${aws_s3_bucket.this.id} S3 bucket"
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  comment             = "Cloudfront distribution for ${aws_s3_bucket.this.id} S3 bucket"
  price_class         = "PriceClass_100"
  default_root_object = var.default_root_object
  is_ipv6_enabled     = true

  aliases = [
    var.domain_name,
  ]

  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/"
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.this.certificate_arn
    minimum_protocol_version = "TLSv1.2_2018"
    ssl_support_method       = "sni-only"
  }

  origin {
    origin_id   = aws_s3_bucket.this.id
    domain_name = aws_s3_bucket.this.bucket_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    target_origin_id       = aws_s3_bucket.this.id
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 3600
    default_ttl            = 86400
    max_ttl                = 259200
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name        = "${var.environment}-${var.stack}-${var.project_name}-cloudfront"
    Environment = var.environment
    Stack       = var.stack
  }
}
