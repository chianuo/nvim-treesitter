; Keywords
;--------------------------

[
"abstract"
"class"
"object"
"trait"
"lazy"
"override"
"extends"
"final"
"package"
"private"
"protected"
"case"
"type"
"with"
"val"
"var"
"def"
] @keyword

[
"match"
] @parameter

[
"import"
] @include


; Operators
;--------------------------

[
"@"
"+"
":"
"-"
"|"
"*"
"="
"~"
] @operator

[
 "new"
] @keyword.operator

; Punctuation
;--------------------------

[ "(" 
  ")" 
  "[" 
  "]" 
  "{" 
  "}" 
] @punctuation.bracket

"$" @punctuation.special

(interpolation
  "$" @punctuation.bracket
  (identifier) @variable)

(interpolation
  "$" @punctuation.bracket
  [
    (identifier) @variable
    (block
        "{" @punctuation.bracket
        (block)
        "}" @punctuation.bracket)
  ])

; Types
;--------------------------

(type_identifier) @type


; Variables
;--------------------------

(identifier) @variable

; Literals
;--------------------------

[
(number)
] @number

(character_literal) @character
(string) @string
(interpolated_string_expression
  (identifier) @variable
  (interpolated_string) @string
)

(comment) @comment

[
(boolean_literal)
] @boolean



; Conditionals
;--------------------------

[
"if"
"else"
"case"
] @conditional

(function_definition
  name: (identifier) @function)
(function_declaration
  name: (identifier) @function)

(symbol_literal) @symbol


; Special identifiers
;--------------------------

((identifier) @constructor
 (#match? @constructor "^[A-Z]"))

((identifier) @constant
 (#vim-match? @constant "^[A-Z_][A-Z\\d_]+$"))

(case_clause
    "case" @keyword
    "=>" @symbol)


; Function and method calls
;--------------------------

(parameter) @parameter
(arguments) @parameter

(call_expression
  function: (identifier) @function)

(field_expression
    "." @method
    field: (identifier) @method)


; Classes 
;--------------------------

(class_definition
  name: (identifier) @type)
(object_definition
  name: (identifier) @type)
(trait_definition
  name: (identifier) @type)
