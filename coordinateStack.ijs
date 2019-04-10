NB. stackNew contents
stackNew =: [

NB. stackEmpty stack | stackNotEmpty stack | stackHasOneElement stack
stackEmpty=:(# = 0:)
stackNotEmpty=:-.@:stackEmpty
stackHasOneElement=:(#@:$ = 1:)

NB. stackPop stack
stackPop =:(({. ; }.)`(] ; 2: }. ]))@.stackHasOneElement

NB. stack stackAdd elem
stackAdd =:,`(((>:@:-:@:#@:[ , 2:) $ ,))@.((1: = #@:$@:[) *. (1: = #@:$@:]))