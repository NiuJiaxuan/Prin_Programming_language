(define (myinterpreter x)
	;(display x) 
	;(newline)
	(mainEval (cadr x) '())
)

(define (mainEval x bind) 
	;the following two lines are used to debug 
	;(display "In mainEval x= ") (display x )(newline)
	;(display "In mainEval bind= ") (display bind ) (newline)
	
	; the following code this used to deal with different conditions
	(cond
		((symbol? x) (lookup x bind))
		((integer? x) x)
		((equal? (car x ) 'planIf ) (evalIf(cdr x ) bind ))
		((equal? (car x ) 'planAdd ) (evalAdd(cdr x ) bind ))
		((equal? (car x ) 'planMul ) (evalMul(cdr x ) bind ))
		((equal? (car x ) 'planSub ) (evalSub(cdr x ) bind ))
		((equal? (car x ) 'planLet ) (evalLet(cdr x ) bind ))
		((equal? (car x) 'planFunction) (evalFunction (cadr x) (cddr x) bind))
		((pair?  x) (evalPair x bind ))
	)
)

;this method is used to deal with add operation
(define (evalAdd x bind)
	(+(mainEval(car x ) bind) (mainEval(cadr x ) bind ))
)

;this method is used to deal with * operation
(define (evalMul x bind )
	(*(mainEval(car x ) bind) (mainEval(cadr x ) bind ))
)

;this method is used to deal with - operation
(define (evalSub x bind )
	(-(mainEval(car x ) bind) (mainEval(cadr x ) bind ))
)

;this method is used to deal with if condition
(define (evalIf x bind )
	(if (> (mainEval(car x) bind ) 0 )
      	(mainEval (cadr x) bind )
      	(mainEval (caddr x) bind )
	)
)

;this method is used to deal with let operation
(define (evalLet x bind)
	;(display x ) (newline)

	; this line is used to form a new bind list for the condition without planFunction

	(mainEval (caddr x) (cons (cons(car x) (mainEval(cadr x) bind) ) bind) )
	;		  	EXPR2			cons (ID 			EXPR1 )

)

;this method is used to find the corresponding value of X
(define (lookup x bind)
	;(display "look for x=") (display x)
	;(newline)
	(if (equal? x (caar bind))
      	(cdar bind)
      	(lookup x (cdr bind))
	)
)

;this method is used to bind ID1 with its following body, like ((a (b (planadd b b))))
(define (evalFunction ID expr1 bind)
	(cons (cons ID expr1) bind )
)

;this method is used to handle the condition while expr2 is encountered and a new binding for id1 has not been introduced
(define (evalPair expr2 bind)

	(cond ( (pair? (lookup (car expr2) bind) )
		    ( mainEval (cadar (lookup (car expr2) bind) ) (cons(cons (caar (lookup (car expr2) bind)) (mainEval (cadr expr2) bind)) '()) )
		   )
		
	)

)