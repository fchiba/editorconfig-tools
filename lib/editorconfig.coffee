editorconfig = require('editorconfig').parse

###*
 * Wrapper for the editorconfig function - converts `indent_style` and
   `indent_size` into `indent_char`
###
module.exports = (filepath) ->
  editorconfig(filepath).then((properties) ->
    properties['indent_char'] = (
      if 'tab' in [properties['indent_size'], properties['indent_style']]
        '\t'
      else if not isNaN(properties['indent_size'])
        Array(properties['indent_size'] + 1).join(' ')
      else if properties['indent_style'] is 'space'
        '  ' # 2 spaces is pretty common
      else
        undefined
    )
    delete properties['indent_style']
    delete properties['indent_size']
    return properties
  )
