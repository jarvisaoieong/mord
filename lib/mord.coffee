program = require 'commander'
pkg = require '../package.json'
md = require 'markdown-word'
path = require 'path'

program
  .version(pkg.version)
  .usage('<markdown.md> <word.docx>')
  .parse process.argv

markdown = program.args.shift()
word = program.args.shift()

unless markdown and word
  console.log program.helpInformation()
  return

unless path.existsSync markdown
  console.log "#{markdown} doesnt exist"
  return

md.documentFromFile markdown, word, (err, data) ->
  if err
    console.log err
    return
  console.log "#{data} generated"

