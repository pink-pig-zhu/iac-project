#パブリックサブネット作成
resource "aws_subnet" "aws-public-subnet" {
  vpc_id = aws_vpc.aws-and-infra-vpc-tf.id
  cidr_block = "10.0.10.0/24" #すでに存在している場合は別にする、じゃないと、エラーになる
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "aws-public-subnet"
  }
}

resource "aws_subnet" "aws-public-subnet2" {
  vpc_id = aws_vpc.aws-and-infra-vpc-tf.id
  cidr_block = "10.0.0.0/24" #すでに存在している場合は別にする、じゃないと、エラーになる
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "aws-public-subnet2"
  }
}
