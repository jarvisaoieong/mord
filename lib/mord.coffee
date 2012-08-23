program = require 'commander'
pkg = require '../package.json'
md = require 'markdown-word'

program
  .version(pkg.version)
  .usage('<markdown> <word>')
  .parse process.argv

markdown = program.args.shift()
word = program.args.shift()

console.log 'Missing <markdown>' unless markdown
unless word
  console.log 'Missing <word>'
  return

md.documentFromFile markdown, word, (err, data) ->
  if err
    console.log err
    return
  console.log "#{data} generated"

