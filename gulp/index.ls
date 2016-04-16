require! <[gulp fs]>
global <<< require \prelude-ls

fs.readdir-sync __dirname
|> filter ( .match /\.ls$/)
|> reject ( .match /^index\.ls$/)
|> each ->
  (require "#__dirname/#it") gulp

