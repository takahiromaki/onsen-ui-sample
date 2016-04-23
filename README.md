# onsen ui sample
OnsenUIで作ったTwitterクライアントサンプルです。

## Getting Started
### github
```
$ git clone https://github.com/takahiromaki/onsen-ui-sample.git
$ cd ./onsen-ui-sample && npm i && gulp build && node index.js
```

### dokcer
```
$ docker pull taka0225/onsen-ui-sample:latest
$ docker run --name onsen-sample -p 80:80 -e CMK="" -e CMS="" -e ATK="" -e ATS="" -d -t taka0225/onsen-ui-sample:latest
```

## 環境変数
```
exports CMK="consumer_key"
exports CMS="consumer_secret_key"
exports ATK="access_token_key"
exports ATS="access_token_secret"
```

## TODO
- Post tweet
- Search tweet
- Streaming timeline
