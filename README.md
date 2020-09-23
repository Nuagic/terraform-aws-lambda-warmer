# terraform-aws-lambda-warmer

This module keep your lambda warm by calling it at regular interval

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
# Terraform 0.11
module "my-lambda_warmer" {
  source        = "Nuagic/lambda-warmer/aws"
  version       = "~> 1.0"
  function_name = "${aws_lambda_function.my-lambda.function_name}"
  function_arn  = "${aws_lambda_function.my-lambda.arn}"
}
```

```hcl
# Terraform  0.12
module "my-lambda_warmer" {
  source        = "Nuagic/lambda-warmer/aws"
  version       = "~> 2.0"
  function_name = aws_lambda_function.my-lambda.function_name
  function_arn  = aws_lambda_function.my-lambda.arn
}
```

```hcl
# Terraform  0.13
module "my-lambda_warmer" {
  source        = "Nuagic/lambda-warmer/aws"
  version       = "~> 3.0"
  function_name = aws_lambda_function.my-lambda.function_name
  function_arn  = aws_lambda_function.my-lambda.arn
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| function_arn |  | string | n/a | yes |
| function_name |  | string | n/a | yes |
| input |  | string | `"{\"Records\":[]}"` | no |
| rate |  | string | `"rate(4 minutes)"` | no |

## Authors

Module managed by [Cyril Feraudet](https://github.com/Nuagic).

## License

Apache 2 Licensed. See LICENSE for full details.
