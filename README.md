# golang in AWS ECR + ECS

Run your container in AWS Fargate.

## Publish your image to AWS ECR using Drone CI

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
    password:
      from_secret: docker_password
  when:
    event:
      exclude:
      - pull_request
```
