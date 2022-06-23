packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "loonie-bets-ec2" {
  ami_name      = "loonie-bets-ec2"
  instance_type = "t3.micro"
  region        = "ca-central-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "loonie-bets"
  sources = [
    "source.amazon-ebs.loonie-bets-ec2"
  ]
  provisioner "shell" {
    // # Env vars not needed at the moment
    // environment_vars = [
    //     "KEY=value",
    // ]
    inline = [
        "echo Installing Docker",
        "sudo apt update",
        "sudo apt install apt-transport-https ca-certificates curl software-properties-common",
        "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
        "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
        "sudo apt update",
        "sudo apt install docker-ce",
        "sudo usermod -aG docker ubuntu",

    ]
  }
  provisioner "file" {
    source = "../caddy/docker-compose.yml"
    destination = "/tmp/caddy-docker-compose.yml"
  }
  provision "shell" {
    inline = [
        "echo Configuring Caddy & Caddy Proxy",
        "docker network create caddy",
        "docker-compose -f /tmp/caddy-docker-compose.yml up -d"
    ]
  }
}


