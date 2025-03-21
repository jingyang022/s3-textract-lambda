resource "aws_iam_role" "lambda_exec_role" {
 name = "lambda_execution_role"
  assume_role_policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
     {
       Action = "sts:AssumeRole",
       Principal = {
         Service = "lambda.amazonaws.com"
       },
       Effect = "Allow"
     }
   ]
 })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
 role       = aws_iam_role.lambda_exec_role.name
 policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_execute" {
 role       = aws_iam_role.lambda_exec_role.name
 policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "textract_FullAccess" {
 role       = aws_iam_role.lambda_exec_role.name
 policy_arn = "arn:aws:iam::aws:policy/AmazonTextractFullAccess"
}