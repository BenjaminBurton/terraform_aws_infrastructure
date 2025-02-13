# Launch Template for Web Servers
resource "aws_launch_template" "web_server_lt" {
  name_prefix            = "web-server-lt"
  image_id               = "ami-04681163a08179f28" # Replace with your desired AMI ID
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras enable php7.4
    yum install -y php php-cli php-mysqlnd php-fpm php-json php-xml php-mbstring php-gd
    wget https://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz
    cp -r wordpress/* /var/www/html/
    chown -R apache:apache /var/www/html
    systemctl start httpd
    systemctl enable httpd
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-server"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  desired_capacity    = 2
  min_size            = 2
  max_size            = 5

  launch_template {
    id      = aws_launch_template.web_server_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_target_group.arn]

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}

# Auto Scaling Policy (Optional)
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}
