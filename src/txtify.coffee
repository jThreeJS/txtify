path = require 'path'
transformTools = require 'browserify-transform-tools'

module.exports = transformTools.makeStringTransform 'txtify', {excludeExtensions: ['.ts','.js']}, (content, opts, done) ->
  # chunkPath = opts.config.chunkPath || ''
  regex = /(\..+)$/gm;
  ext = regex.exec(opts.file)[1];
  if opts.config.extensions.indexOf(ext) >= 0
    result = null;
    if ext == ".json"
      content = JSON.parse(content);
    if content != null
      result = "module.exports = " + (JSON.stringify(content));
  done null, result
