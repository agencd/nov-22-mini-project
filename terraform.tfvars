subnets = {
  pub_sub_1 = {
    cidr_block        = "172.16.0.0/24"
    availability_zone = "us-east-1a"
  }
  pub_sub_2 = {
    cidr_block        = "172.16.1.0/24"
    availability_zone = "us-east-1b"
  }
  pub_sub_3 = {
    cidr_block        = "172.16.2.0/24"
    availability_zone = "us-east-1c"
  }
  priv_sub_1 = {
    cidr_block        = "172.16.10.0/24"
    availability_zone = "us-east-1a"
  }
  priv_sub_2 = {
    cidr_block        = "172.16.11.0/24"
    availability_zone = "us-east-1b"
  }
  priv_sub_3 = {
    cidr_block        = "172.16.12.0/24"
    availability_zone = "us-east-1c"
  }
}

security_groups = {
  "alb_sg" : {
    description = "Application Load Balancer SG"
    ingress_rules = [
      {
        description = "ingress rule for http"
        priority    = 200
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "ingress rule for https"
        priority    = 204
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}

ec2 = {
  app-server = {
    server_name = "APP_SERVER"
    subnet      = "priv_sub_1"
  }
  dev-server = {
    server_name = "DEV_SERVER"
    subnet      = "priv_sub_2"
  }
  web-server = {
    server_name = "WEB_SERVER"
    subnet      = "priv_sub_3"
  }
}