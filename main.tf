provider "AWS"{
  region = var.region
}
resource "AWS" "example-VPC" {
  name = "Hemanth_VPC"
}
resource "AWS" "public_subnet" {
  name = "Hemanth_publicsubnet"
  ip_cidr_range = "0.0.0.0/16"
  region = var.region
  network = aws.vpc_network.id
}
resource "AWS" "privatsubnet" {
  name = "Hemanth_privatesubnet"
  ip_cidr_range = "0.0.0.0/24"
  region = var.region
  network = aws.vpc_network.id
}
resource "AWS" "EC2_instance" {
  region = var.region
  instance_type = "t2-micro"
  ami_id = var.amiid
  user-data = #!/bin/bash
              sudo yum update -y
              sudo wget install "ngnix_download_URL"
              sudo systemctl start ngnix
              sudo systemctl enable ngnix
  tags = {
  name = "ngnix"
}  
  }
resource "AWS" "allow_http_https_requests" {
  name = "allow_requests"
  ingress {
    from = [ "80","443"]
    to = ["80","443"]
    protocal = "tcp"
    cidr_block = [ "0.0.0.0/0" ]
    }

  egress {
    from = 0
    to = 0
    protocal = "-1"
    cidr_block = [ "0.0.0.0/0" ]
  }
}

