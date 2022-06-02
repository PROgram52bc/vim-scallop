if exists("b:current_syntax")
    finish
endif

syntax match scallopIdentifier "\v[a-zA-Z][a-zA-Z0-9_]*"
highlight link scallopIdentifier Identifier

syntax keyword scallopLiteral true false
syntax match scallopLiteral "\v[0-9][0-9_]*\.[0-9][0-9_]*([eE][+-]?[0-9_]+)?"
syntax match scallopLiteral "\v[0-9][0-9_]*"
highlight link scallopLiteral Constant

syntax keyword scallopKeyword import type input rel relation query output
" syntax keyword scallopKeyword count sum prod min max
highlight link scallopKeyword Keyword

syntax keyword scallopOperator and or not implies
syntax match scallopOperator "\v(:-|\=)"
syntax match scallopOperator "\v(\&\&|\=\=|\|\||!\=)"
syntax match scallopOperator "\v(!|\+|-|/|\*|\%)"
syntax match scallopOperator "\v(\\/|/\\)"
syntax match scallopOperator "\v(\<\=|\>\=|\<|\>)"
highlight link scallopOperator Operator

syntax region scallopString matchgroup=scallopQuote start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link scallopString String

syntax keyword scallopType i8 i16 i32 i64 i128 isize u8 u16 u32 u64 u128 usize f32 f64 char bool String
syntax match scallopType "\v(\&str|Rc\<String\>)"
highlight link scallopType Type

syntax match scallopComment "\v\/\/.*$"
syntax match scallopComment "\v/\*\_.{-}\*/"
highlight link scallopComment Comment

" aggregator keywords
syntax match scallopAggregator "\v[^@]\zs(count|prod|sum|min|max)\ze\("

" nested scope highlight. use matchgroup to highlight only the start and end
syntax region scope1 matchgroup=scallopBraces start=/{/ end=/}/ contains=scope3,scallop.*
syntax region scope2 matchgroup=scallopParen1 start=/(/ end=/)/ contains=scope3,scallop.*
syntax region scope3 matchgroup=scallopParen2 start=/(/ end=/)/ contains=scope4,scallop.* contained
syntax region scope4 matchgroup=scallopParen3 start=/(/ end=/)/ contains=scope2,scallop.* contained

highlight scallopQuote term=bold ctermfg=LightRed gui=bold guifg=LightRed
highlight scallopParen1 term=bold ctermfg=Yellow gui=bold guifg=LightYellow
highlight scallopParen2 term=bold ctermfg=Magenta gui=bold guifg=Magenta
highlight scallopParen3 term=bold ctermfg=Brown gui=bold guifg=Brown
highlight scallopBraces term=bold ctermfg=DarkCyan gui=bold guifg=DarkCyan
highlight scallopAggregator term=bold ctermfg=DarkCyan gui=bold guifg=DarkCyan

let b:current_syntax = "scallop"
