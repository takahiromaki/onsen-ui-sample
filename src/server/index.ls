require! <[express twitter morgan]>
global <<< require \prelude-ls
client = new twitter do
  consumer_key: process.env.CMK
  consumer_secret: process.env.CMS
  access_token_key: process.env.ATK
  access_token_secret: process.env.ATS

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
