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
  frontkansai: void

express!
  ..listen 80
  ..use morgan format: \dev, immediate: yes
  ..use express.static \public
  ..|> (app)->
    <[user home]> |> map (type)->
      app.route "/twitter/#type" .get (req, res)->
        if req.query.refresh is \true then timeline.(type) = void
        if timeline.(type)? then res.json that
        else
          err, tweets, response <~ client.get "statuses/#{type}_timeline", \nodejs
          res.json (timeline.(type) = tweets)
    app.route \/twitter/frontkansai .get (req, res)->
      if req.query.refresh is \true then timeline.frontkansai = void
      if timeline.frontkansai? then res.json that
      else
        err, tweets, response <~ client.get "search/tweets", q: \#frontkansai
        res.json (timeline.frontkansai = tweets.statuses)

console.log "GetReady!"
