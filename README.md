# golang in AWS ECR + ECS

Run your container in AWS Fargate.

## Permissions

The following minimum permissions are required for pushing and pulling images in an ECR repository:

```json
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Sid":"AllowPush",
         "Effect":"Allow",
         "Action":[
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload"
         ],
         "Resource":"arn:aws:ecr:us-east-1:123456789012:repository/my-repo"
      }
   ]
}
```

## Publish your image to AWS ECR

Deploy with [Drone CI](https://drone.io/)

```yml
- name: publish
  pull: always
  image: plugins/ecr
  settings:
    access_key:
      from_secret: aws_access_key_id
    secret_key:
      from_secret: aws_secret_access_key
    repo: api-sample
    region: ap-northeast-1
    registry:
      from_secret: registry
    auto_tag: true
    daemon_off: false
    dockerfile: Dockerfile
  when:
    event:
      exclude:
      - pull_request
```

Deploy with [GitHub Actions](https://github.com/features/actions)

```yml
build:
  name: upload image
  runs-on: ubuntu-latest
  steps:
  - uses: actions/checkout@master
  - name: upload image to ECR
    uses: appleboy/docker-ecr-action@v0.0.2
    with:
      access_key: ${{ secrets.aws_access_key_id }}
      secret_key: ${{ secrets.aws_secret_access_key }}
      registry: ${{ secrets.registry }}
      cache_from: ${{ secrets.cache }}
      repo: api-sample
      region: ap-northeast-1
```
