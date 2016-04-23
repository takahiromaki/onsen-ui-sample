require! <[express twitter morgan]>
global <<< require \prelude-ls
client = new twitter do
  consumer_key: "FCvyFnCUqjyoWHzQqFUfg"
  consumer_secret: "xTw3YrGHOpvhHWkR47RRtIjKF7j80EUVhZpUVWU3Q"
  access_token_key: "576107610-pCJD832tpAjTddpGQ144uWri4oVzBDc0IAK1j6jz"
  access_token_secret: "5KcTJJ5eC3bIVgz8FeBw0B1Uwfwz4Z0Pdp0y8ysyJA"

timeline =
  home: void
  user: void

express!
  ..listen 3333
  ..use morgan format: \dev, immediate: yes
  ..use express.static \public
  ..get \/twitter/user, (req, res)->
    if timeline.home? then res.json that
    else
      err, tweets, response <~ client.get \statuses/user_timeline, \nodejs
      res.json (timeline.home = tweets)
  ..get \/twitter/home, (req, res)->
    if timeline.user? then res.json that
    else
      err, tweets, response <~ client.get \statuses/home_timeline, \nodejs
      res.json (timeline.user = tweets)


console.log "GetReady!"
