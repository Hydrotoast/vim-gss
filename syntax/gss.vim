if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim
runtime! after/syntax/css.vim

syn case ignore

syn match gssCombinators "&"
syn match gssCombinators "\$"
syn match gssCombinators "\^"

" TODO: Finish fancy selectors

syn match gssArithmeticOperators "+" contained
syn match gssArithmeticOperators "-" contained
syn match gssArithmeticOperators "*" contained
syn match gssArithmeticOperators "/" contained

syn match gssConstraintOperators ">" contained
syn match gssConstraintOperators "<" contained
syn match gssConstraintOperators ">=" contained
syn match gssConstraintOperators "<=" contained
syn match gssConstraintOperators "==" contained

syn match gssProperty /\v[[:alnum:]]+/ contained
syn region gssPropertyAccessors start=/\v\[/ end=/\v\]/ contains=gssProperty

syn match gssStrengths "!required" contained
syn match gssStrengths "!require" contained
syn match gssStrengths "!strong" contained
syn match gssStrengths "!medium" contained
syn match gssStrengths "!weak" contained

syn match gssReservedPseudos "::document"
syn match gssReservedPseudos "::host"
syn match gssReservedPseudos "::scope"
syn match gssReservedPseudos "::parent"
syn match gssReservedPseudos "::window"
syn match gssReservedPseudos "::viewport"
syn match gssReservedPseudos "::this"

syn match gssConditionals "@if"
syn match gssConditionals "@else"

syn match gssInlineComments "//.*$"
syn region gssBlockComments start="\/\*" end="\*\/"

syn match gssConstraintExpressions /\v.*[=<>]{1,2}.*/ contains=gssConstraintOperators,gssArithmeticOperators,gssStrengths,gssCombinators,gssPropertyAccessors,gssReservedPseudos,gssConditionals,gssBlockComments,gssInlineComments
syn region gssRulesets start="{" end="}" transparent contains=gssConstraintExpressions,gssBlockComments

hi link gssReservedPseudos Constant
hi link gssProperty String

hi link gssConditionals Conditional
hi link gssArithmeticOperators Operator
hi link gssConstraintOperators Operator
hi link gssRulesetConstraintOperators Operator

hi link gssCombinators Function
hi link gssPropertyAccessors Function

hi link gssStrengths Special

hi link gssInlineComments Comment
hi link gssBlockComments Comment

let b:current_syntax = "gss"
