fs =   require 'fs'

logger = require '../../util/logger'
fileUtils = require '../../util/file'

class MimosaFileWriteModule

  lifecycleRegistration: (config, register) ->

    unless config.virgin
      e = config.extensions
      cExts = config.copy.extensions
      register ['startupFile'],           'write',  @_write, [e.javascript..., cExts...]
      register ['startupExtension'],      'write',  @_write, [e.template..., e.css...]
      register ['add','update','remove'], 'write',  @_write, [e.template..., e.css...]
      register ['add','update'],          'write',  @_write, [e.javascript..., cExts...]

  _write: (config, options, next) =>
    return next(false) unless options.files?.length > 0

    i = 0
    done = =>
      next() if ++i is options.files.length

    options.files.forEach (file) =>
      return done() unless file.outputFileText? and file.outputFileName?
      logger.debug "Writing file [[ #{file.outputFileText} ]]"
      fileUtils.writeFile file.outputFileName, file.outputFileText, (err) =>
        logger.error "Failed to write new file: #{file.outputFileName}" if err?
        done()

module.exports = new MimosaFileWriteModule()