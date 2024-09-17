# docker-satisfactory-server

## Description

Easy to use Satisfactory server with Docker,, automatic backups via restic and ssh access.

## Usage

### Start the server

Start and attach to the console

```bash
make start-at
```

### Down/Stop the server

```bash
make down
```

### Update the server (Docker image)

```bash
make update-docker
```

### SSH into the server

```bash
ssh -p 2222 admin@127.0.0.1
```

For the sudo password, use: **zpd91zZkCfdyAB8PZgUD7w7ZIhS8no4V** or *USER_PASSWORD* variable in [openssh.env](satisfactory/openssh/env/openssh.env).
