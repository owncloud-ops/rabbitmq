# rabbitmq

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/rabbitmq/status.svg)](https://drone.owncloud.com/owncloud-ops/rabbitmq/)
[![Docker Hub](https://img.shields.io/badge/docker-latest-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/owncloudops/rabbitmq)
[![Quay.io](https://img.shields.io/badge/quay-latest-blue.svg?logo=docker&logoColor=white)](https://quay.io/repository/owncloudops/rabbitmq)

Custom container image for [RabbitMQ](https://www.rabbitmq.com/) Messsage Broker.

## Ports

- 5672

## Volumes

- /var/lib/rabbitmq

## Environment Variables

```Shell
RABBITMQ_VHOST="/"
RABBITMQ_USER="owncloud"
RABBITMQ_PASSWORD="owncloud"

RABBITMQ_VM_MEMORY_HIGH_WATERMARK_RELATIVE="0.4"
RABBITMQ_VM_MEMORY_HIGH_WATERMARK_ABSOLUTE=

RABBITMQ_DISK_FREE_LIMIT_RELATIVE="1.0"
RABBITMQ_DISK_FREE_LIMIT_ABSOLUTE=

RABBITMQ_LOG_LEVEL="info"
```

## Build

```Shell
docker build -f Dockerfile --target rabbitmq -t rabbitmq:latest .
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/owncloud-ops/rabbitmq/blob/main/LICENSE) file for details.
