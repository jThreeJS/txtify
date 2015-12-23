path = require 'path'
transformTools = require 'browserify-transform-tools'

module.exports = transformTools.makeStringTransform 'txtify', {includeExtensions: ['.svg', '.html','.css','.xmml']}, (content, opts, done) ->
  # chunkPath = opts.config.chunkPath || ''
  result = null
  if content?
    result = "module.exports = #{JSON.stringify(content)}"
  done null, result
