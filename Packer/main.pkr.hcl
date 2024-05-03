
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
    ami_name  = "amazon-linux-dev"
    source_ami = "ami-0eb260c4d5475b901"
    instance_type = "t2.micro"
    region        = "eu-west-2"
    profile = "jkbk"
    ssh_username = "ec2-user"

    vpc_filter {
        filters = {
        "tag:Name": "dev-main",
        }
    }
    
    subnet_filter {
        filters = {
        "tag:Name": "dev-public-eu-west-2a",
        }
    }
}

build {
    sources = [
        "source.amazon-ebs.ubuntu"
    ]
        
    provisioner "file" {
        source = "../ansible/ansible_code.zip"
        destination = "/home/ec2-user/ansible_code.zip"
    }

    provisioner "shell" {
        script = "../bash/script.sh"
    }
}
