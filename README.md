# Docker image for [YApi](https://github.com/YMFE/yapi)

## Config

Config file must be mounted at `/app/config.json` in container. Here is an example config file.

```json
{
  "port": "3000",
  "adminAccount": "admin@admin.com",
  "db": {
    "servername": "127.0.0.1",
    "DATABASE": "yapi",
    "port": 27017,
    "user": "test1",
    "pass": "test1",
    "authSource": ""
  },
  "mail": {
    "enable": true,
    "host": "smtp.163.com",
    "port": 465,
    "from": "***@163.com",
    "auth": {
      "user": "***@163.com",
      "pass": "*****"
    }
  }
}
```

## Initialize

You must initialize the **YApi** before you run it for the first time.

```bash
docker run -ti --rm -v $PWD/yapi.json:/app/config.json cuigh/yapi:v1.3.17 /app/yapi/server/install.js
```

## Run

```bash
docker run -ti --rm -v $PWD/yapi.json:/app/config.json -p 3000:3000 cuigh/yapi:v1.3.17
```