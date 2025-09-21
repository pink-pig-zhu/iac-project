#1 ルートテーブル作成
resource "aws_route_table" "aws-public-route" {
  vpc_id = aws_vpc.aws-and-infra-vpc-tf.id

  tags = {
    Name = "aws-public-route"
  }
}

#2 インターネット向けルート作成
resource "aws_route" "public-internet" {
  route_table_id = aws_route_table.aws-public-route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = data.aws_internet_gateway.existing_igw.id
}

#3 サブネットにルートテーブル関連付け
resource "aws_route_table_association" "public-association" {
  for_each = {
    az1 = aws_subnet.aws-public-subnet.id
    az2 = aws_subnet.aws-public-subnet2.id
  }
  subnet_id = each.value
  route_table_id = aws_route_table.aws-public-route.id
}