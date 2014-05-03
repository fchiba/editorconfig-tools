﻿exports.rules = [];

[
    'charset',
    'end_of_line',
    'indent_size',
    'indent_style',
    'insert_final_newline',
    'max_line_length',
    'tab_width',
    'trim_trailing_whitespace'
].forEach(function (ruleName) {
    exports.rules.push(require('./' + ruleName));
});
