variable "amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-0a699202e5027c10d"
    us-east-2 = "ami-00cda30cf72311684"

  }
}

variable "region" {
    type    = string
    default = "us-east-1"

  }

variable "key" {
    type = map(any)
    default = {
      us-east-1 = "keypair"
      us-east-2 = "east2-key"
    }
  }

variable "zones" {
    default = {
      us-east-1 = ["us-east-1c", "us-east-1d", "us-east-1e"]
      us-east-2 = ["us-east-2a", "us-east-2b", "us-east-2c"]
    }
  }