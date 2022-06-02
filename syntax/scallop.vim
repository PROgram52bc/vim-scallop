if exists("b:current_syntax")
    finish
endif

syntax keyword scallopKeyword import type input rel relation count sum prod min max
highlight link scallopKeyword Keyword

syntax keyword scallopOperator and or not implies
syntax match scallopOperator "\v(:-|\=)"
syntax match scallopOperator "\v(\&\&|\=\=|\|\||!\=)"
syntax match scallopOperator "\v(!|\+|-|/|\*|\%)"
syntax match scallopOperator "\v(\\/|/\\)"
syntax match scallopOperator "\v(\<\=|\>\=|\<|\>)"
highlight link scallopOperator Operator

syntax region scallopString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link scallopString String

syntax keyword scallopType i8 i16 i32 i64 i128 isize u8 u16 u32 u64 u128 usize f32 f64 char bool String 
syntax match scallopType "\v(\&str|Rc\<String\>)"
highlight link scallopType Type

syntax match scallopComment "\v\/\/.*$"
syntax match scallopComment "\v/\*\_.{-}\*/"
highlight link scallopComment Comment


let b:current_syntax = "scallop"
