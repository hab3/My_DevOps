# Load Balancer Configuration
resource "aws_lb" "my_alb" {
  name               = "my-demo-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.public_subnet[*].id

}


resource "aws_security_group" "alb_sg" {
  name        = "demo_alb_sg"
  description = "open 80 to anywhere"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Target Group Configuration (Students should complete this section)

resource "aws_lb_target_group" "demo_tg" {
  name     = "lb-tg" # Define the Target Group configuration here.
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id
}


# Target Group Configuration (Students should complete this section)
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.demo_tg.arn # Define the Target Group Attachment configuration here.
  count            = 2
  target_id        = aws_instance.ec2_instance[count.index].id
  port             = 80
}

# Listener Configuration (Students should complete this section)
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo_tg.arn
  }
}


