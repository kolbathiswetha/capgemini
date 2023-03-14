resource "aws_alb" "example" {
  name            = "example-alb"
  internal        = false
  security_groups = [aws_security_group.alb_sg.id]
  #security_groups = [ data.terraform_remote_state.vpc.outputs.vpc_sg ]
  subnets = [data.terraform_remote_state.vpc.outputs.public_subnet_1,data.terraform_remote_state.vpc.outputs.public_subnet_2]
    tags = {
    Terraform   = "true"
    Environment = "qa"
  }
}
resource "aws_internet_gateway" "example" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "example-igw"
  }
}
resource "aws_alb_target_group" "example" {
  name = "example-alb-tg"
  port = "80"
  protocol = "HTTP"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow HTTP traffic"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_alb_listener" "example" {
  load_balancer_arn = aws_alb.example.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.example.arn
  }
}

resource "aws_alb_target_group_attachment" "example" {
  target_group_arn = aws_alb_target_group.example.arn
  target_id = data.terraform_remote_state.vpc.outputs.instance_id
  port = 80
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_subnet" "public" {
#   count = 2

#   cidr_block = "10.0.${count.index + 1}.0/24"
#   vpc_id     = aws_vpc.main.id

#   tags = {
#     Name = "public-${count.index + 1}"
#   }
# }

data "terraform_remote_state" "vpc" {
       backend = "s3"
       config = {
        bucket = "terrastate-test-vijay"
        key    = "env:/dev/state/terraform.tfstate"
        region = "us-east-1"
  }
}