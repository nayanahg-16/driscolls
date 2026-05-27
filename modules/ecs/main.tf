resource "aws_ecs_cluster" "cluster" {
  name = "${var.env}-ecs-cluster"
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name = "/ecs/${var.env}-app"
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.env}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name  = "${var.env}-container"
      image = var.container_image

      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "${var.env}-ecs-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups  = var.security_group_ids
    subnets          = var.subnet_ids
  }

  depends_on = [
    aws_ecs_task_definition.ecs_task
  ]
}



 
