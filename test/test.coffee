path = require 'path'
browserify = require 'browserify'
txtify = require '../src/txtify'
chai = require 'chai'
expect = chai.expect
fs = require 'fs'

describe "txtify", ->
  it "should be return txt content", (done) ->
    correct = 'sample\n'
    b = browserify()
    b
      .add path.resolve(__dirname, './sample/sample-js.js')
      .transform txtify
      .bundle (err, buf) ->
        fs.open path.resolve(__dirname, './sample/sample-output.js'), 'w', (err_, fd) ->
          fs.write fd, buf, 0, buf.length, null, ->
            fs.close fd, ->
              require path.resolve(__dirname, './sample/sample-output.js')
              result = global.result
              expect(result).to.equal(correct)
              done()
