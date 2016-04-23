from node:latest
add . /usr/src/app
workdir /usr/src/app
run npm i
cmd ["node", "index.js"]
