# RDS MySQL Instance (Private)
resource "aws_db_instance" "mysql_db" {
  identifier             = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az               = false
  username               = "admin"
  password               = "adminpassword"
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "mydb"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "db-subnet-group"
  }
}