#プライベートサブネット作成
resource "aws_subnet" "aws-private-subnet" {
  vpc_id = aws_vpc.aws-and-infra-vpc-tf.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "aws-private-subnet"
  }
}