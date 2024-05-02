resource "aws_ecs_cluster" "main" {
  name = "2h9942-ecs-cluster"
  tags = {
    Name = "2h9942-ecs-cluster"
  }
}

resource "aws_ecs_task_definition" "fumidai" {
  family                   = "2h9942-ecs-taskdef-fumidai"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  task_role_arn            = aws_iam_role.ecs_task.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions    = file("./ecs-taskdef.json")
  tags = {
    Name = "2h9942-ecs-taskdef-fumidai"
  }
}

resource "aws_ecs_service" "main" {
  name                   = "2h9942-ecs-service"
  cluster                = aws_ecs_cluster.main.id
  task_definition        = aws_ecs_task_definition.fumidai.arn
  enable_execute_command = true
  desired_count          = 0
  launch_type            = "FARGATE"
  network_configuration {
    # security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = ["${aws_subnet.public-1a.id}", "${aws_subnet.public-1c.id}", "${aws_subnet.public-1d.id}"]
    assign_public_ip = true
  }
  tags = {
    Name = "2h9942-ecs-service"
  }
}