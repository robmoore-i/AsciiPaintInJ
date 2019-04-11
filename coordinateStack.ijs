NB. stackNew contents
stackNew =: [

NB. stackEmpty stack | stackNotEmpty stack | stackHasOneElement stack
stackEmpty=:(# = 0:)
stackNotEmpty=:-.@:stackEmpty
stackHasOneOrFewerElements=:(#@:$ = 1:)

NB. stackPop stack
stackPop =:(({. ; }.)`(] ; 2: }. ]))@.stackHasOneOrFewerElements

NB. stack stackAdd elem
stackAdd =:,`(((>:@:-:@:#@:[ , 2:) $ ,))@.((1: = #@:$@:[) *. (1: = #@:$@:]))