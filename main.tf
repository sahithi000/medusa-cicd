provider "aws" {
  region = "us-east-1"
}
resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}
resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode            = "awsvpc"

  container_definitions = jsonencode([{
    name      = "medusa"
    image     = "medusajs/medusa"
    essential = true
    portMappings = [{
      containerPort = 9000
      hostPort      = 9000
    }]
  }])
}
resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["subnet-12345678"]     # dummy
    security_groups = ["sg-12345678"]         # dummy
    assign_public_ip = true
  }
}

