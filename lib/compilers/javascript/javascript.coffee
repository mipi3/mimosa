AbstractSingleFileCompiler = require '../single-file'
logger = require '../../util/logger'
Linter = require '../../util/lint/js'

module.exports = class AbstractJavaScriptCompiler extends AbstractSingleFileCompiler
  outExtension: 'js'

  constructor: (config) ->
    super(config, config.compilers.javascript)

    @notifyOnSuccess = config.growl.onSuccess.javascript

    if config.lint.compiled.javascript
      @linter = new Linter(config.lint.rules.javascript)

  afterCompile: (destFileName, source) ->
    @linter.lint(destFileName, source) if @linter?
    source

  afterWrite: (fileName) ->
    @optimize()


