resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = "eu-west-2${element(["a", "b"], count.index)}"
  map_public_ip_on_launch = true
  tags = { Name = "public-subnet-${count.index + 1}" }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = "eu-west-2${element(["a", "b"], count.index)}"
  tags = { Name = "private-subnet-${count.index + 1}" }
}

resource "aws_subnet" "db" {
  count             = length(var.db_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidrs[count.index]
  availability_zone = "eu-west-2${element(["a", "b"], count.index)}"
  tags = { Name = "db-subnet-${count.index + 1}" }
}
