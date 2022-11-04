
region = "us-east-1"

project = "koffeeluv-devtool"

environment = "production"

repository = {
  name        = "KoffeeLuv"
  description = "KoffeeLuv Application"
}

build = {
  name        = "koffeeluv-build"
  description = "KoffeeLuv Build Steps"

  artifacts = {
    s3 = "ra-koffeeluv-artifacts"
  }

  iam_role = {
    name = "koffeeluv-codebuild-iam-role"
  }
}
