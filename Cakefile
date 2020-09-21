
fs = require "fs"
path = require "path"

cs = require "coffeescript"
uglify_js = require "uglify-js"

githome = "https://github.com/le0developer/onetap/blob/master/"
license = (fs.readFileSync "LICENSE").toString()
scripts = JSON.parse fs.readFileSync "scripts.json"


zfill = (number, length) ->
    string = number.toString()
    if string.length >= length then string else "0".repeat(length - string.length) + string

# Taken from https://gist.github.com/lambdalisue/1283508#file-cakefile-L45
#    - Added zfill()
# Licensed under MIT
class reporter
    @RESET: '\u001b[0m'
    @BOLD: '\u001b[0;1m'
    @GREEN: '\u001b[0;32m'
    @RED: '\u001b[0;31m'
    @MAGENTA: '\u001b[0;35m'
    @TICK: '\u2713'
    @CROSS: '\u2613'
    @_write: (color, message, args) ->
        message = "#{color}#{message}#{reporter.RESET}" if color?
        console.log.apply @, ([message].concat args)
    @_writeError: (color, message, args) ->
        message = "#{color}#{message}#{reporter.RESET}" if color?
        console.error.apply @, ([message].concat args)
    @_now: ->
        date = new Date
        "#{zfill date.getHours(), 2}:#{zfill date.getMinutes(), 2}:#{zfill date.getSeconds(), 2}"
    @log: (message='', args...) ->
        reporter._write null, message, args
    @info: (message, args...) ->
        reporter._write reporter.GREEN, message, args
    @head: (message, args...) ->
        reporter._write reporter.BOLD, message, args
    @warn: (message, args...) ->
        reporter._writeError reporter.MAGENTA, message, args
    @error: (message, args...) ->
        reporter._writeError reporter.RED, message, args
    @success: (message, args...) ->
        reporter._write null, "[#{reporter._now()}] #{reporter.GREEN}#{reporter.TICK}  #{message}#{reporter.RESET}", args
    @fail: (message, args...) ->
        reporter._write null, "[#{reporter._now()}] #{reporter.RED}#{reporter.CROSS}  #{message}#{reporter.RESET}", args

ensure_path = (p) ->
    if fs.existsSync path.dirname p
        return
    
    parents = []
    current = p
    loop
        current = path.dirname current
        if fs.existsSync current then break
        parents.push current
    
    for parent in parents
        fs.mkdirSync parent


task "build", "'compile' and 'minify'", (options) ->
    invoke "compile"
    invoke "minify"


task "compile", "compile all coffeescripts from scripts.json to javascripts", (options) ->
    for coffee in scripts
        if not fs.existsSync coffee
            reporter.fail "Coffeescript not found #{coffee}"
            continue

        js = path.join path.dirname(coffee), "dist", ((path.basename coffee).slice 0, -(path.extname coffee).length) + ".js"

        updated = true
        if fs.existsSync js
            stats_coffee = fs.statSync coffee
            stats_js = fs.statSync js
            updated = stats_coffee.mtime > stats_js.mtime
        
        if updated
            coffee_code = fs.readFileSync(coffee).toString()
            try
                js_code = cs.compile coffee_code, {filename: coffee, header: true, bare: true}
            catch error
                reporter.fail "Unable to compile coffeescript #{coffee}"
                reporter.log error.toString()
                continue
            
            js_code = """
            /*
            Github: #{githome}#{coffee}
            Automatically generated and compiled on #{(new Date).toString()}

            #{license}
            */

            """ + js_code
            
            ensure_path js
            fs.writeFileSync js, js_code

            reporter.success "Compiled coffeescript #{coffee} to #{js}"


task "minify", "minify all compiled javascripts", (options) ->
    for coffee in scripts
        js = path.join path.dirname(coffee), "dist", ((path.basename coffee).slice 0, -(path.extname coffee).length) + ".js"
        min = path.join path.dirname(coffee), "dist", ((path.basename coffee).slice 0, -(path.extname coffee).length) + ".min.js"

        if not fs.existsSync js
            reporter.fail "Compiled javascript not found #{js}"
            continue

        updated = true
        if fs.existsSync min
            stats_js = fs.statSync js
            stats_min = fs.statSync min
            updated = stats_js.mtime > stats_min.mtime

        if updated
            js_code = fs.readFileSync(js).toString()
            minified = uglify_js.minify(js_code)
            unless minified.code?
                reporter.fail "Unable to minify javascript #{js}"
                reporter.fail "#{minified.error.line}:#{minified.error.col} #{minified.error.message}"
                continue

            min_js = minified.code

            min_js = "// LICENSE: #{githome}LICENSE\n// Github: #{githome}#{coffee}\n// Automatically generated and compiled on #{(new Date).toString()}\n" + min_js

            fs.writeFileSync min, min_js

            reporter.success "Minified javascript #{js} to #{min}"
