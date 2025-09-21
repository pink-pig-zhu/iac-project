#VPC作成
resource "aws_vpc" "aws-and-infra-vpc-tf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aws-and-infra-vpc-tf"
  }
}

# #インターネットゲートウェイ作成
# resource "aws_internet_gateway" "aws-igw" {
#   vpc_id = aws_vpc.aws-and-infra-vpc-tf.id
#   tags = {
#     Name = "aws-igw"
#   }
# }

#既存IGWをデータとして取得
data "aws_internet_gateway" "existing_igw" {
  filter {
    name = "attachment.vpc-id"
    values = [aws_vpc.aws-and-infra-vpc-tf.id]
  }
}

