resource "aws_instance" "ec2_instance" {
  count                  = 2                       #set the desired count here
  ami                    = var.amis[var.region] # Replace with your desired AMI ID  #CHANGED
  instance_type          = "t2.micro"
  key_name               = var.key[var.region] #CHANGED
  subnet_id              = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
    echo "<html><body style='background-color:lightblue'><center><h1>Hello World from $IP</h1></center></body></html>" > index.html
    nohup python -m SimpleHTTPServer 80 &
EOF

  tags = {
    Name = "demo_vpc_instance"
  }

}


resource "aws_security_group" "ec2_sg" {
  name        = "demo_ec2_sg"
  description = "open 22 to m IP and 80 to alb_sg"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.145.11.0/32"]

  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]

  }

    egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]

  }
}

