resource "aws_iam_role" "ecs_task_execution_role" {
  name = "2h9942-iamrole-ECSTaskExecution"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
  tags = {
    Name = "2h9942-iamrole-ECSTaskExecution"
  }
}


resource "aws_iam_role" "ecs_task" {
  name = "2h9942-iamrole-ECSTask"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    Name = "2h9942-iamrole-ECSTask"
  }
}

data "aws_iam_policy_document" "ecs_task_role_ssmmessages" {
  version = "2012-10-17"
  statement {
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ecs_task_ssmmessages" {
  name   = "2h9942-iampolicy-ECSTask-ECSExec"
  policy = data.aws_iam_policy_document.ecs_task_role_ssmmessages.json
  tags = {
    Name = "2h9942-iampolicy-ECSTask-ECSExec"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_ssmmessages" {
  role       = aws_iam_role.ecs_task.name
  policy_arn = aws_iam_policy.ecs_task_ssmmessages.arn
}