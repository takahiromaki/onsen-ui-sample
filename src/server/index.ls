require! <[express]>

express!
  ..use express.static \public
  ..listen 9999

console.log "GetReady!"
