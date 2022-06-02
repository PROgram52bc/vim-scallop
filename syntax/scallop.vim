if exists("b:current_syntax")
    finish
endif

syntax keyword scallopKeyword import type input rel relation count sum prod min max
highlight link scallopKeyword Keyword

syntax match scallopOperator "\v\*"
syntax match scallopOperator "\v/"
syntax match scallopOperator "\v\+"
syntax match scallopOperator "\v-"
syntax match scallopOperator "\v\?"
syntax match scallopOperator "\v\*\="
syntax match scallopOperator "\v/\="
syntax match scallopOperator "\v\+\="
syntax match scallopOperator "\v-\="
highlight link scallopOperator Operator

syntax match scallopComment "\v\/\/.*$"
syntax match scallopComment "\v/\*\_.{-}\*/"
highlight link scallopComment Comment

let b:current_syntax = "scallop"
