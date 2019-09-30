resource "aws_cloudwatch_event_rule" "this" {
  name                = "lambda_warmer-${var.function_name}"
  description         = "Keep warm ${var.function_name} lambda"
  schedule_expression = "${var.rate}"
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = "${aws_cloudwatch_event_rule.this.name}"
  target_id = "${var.function_name}"
  arn       = "${var.function_arn}"

  input_transformer {
    input_template = "${var.input}"
  }
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.this.arn}"
}
