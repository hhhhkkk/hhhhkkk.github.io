FROM node:lts-alpine

WORKDIR /app

COPY . /app

RUN npm config set registry https://registry.npmmirror.com && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && apk add git && npm install hexo-deployer-git --save && apk add openssh && npm install -g hexo-cli

EXPOSE 4000

# CMD [ "npm", "run", "server" ]
