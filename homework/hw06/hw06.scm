(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (ascending? lst) 
    (if (or (null? (cdr lst)) (null? lst))
        #t
        (and (>= (cadr lst) (car lst)) (ascending? (cdr lst))
        )
    )
)

(define (interleave lst1 lst2) 
    (if (null? lst1) lst2
        (if (null? lst2) lst1
            (cons (car lst1)
                (cons (car lst2) (interleave (cdr lst1) (cdr lst2))
                )
            )
        )
    )
)



(define (my-filter func lst) 
    (cond 
        ((null? lst) () )
        ((func (car lst)) (cons (car lst) (my-filter func (cdr lst))))
        (else (my-filter func (cdr lst)))
    )
)




(define (no-repeats lst) 
(if 
  (null? lst) '()
(cons (car lst) 
(no-repeats (my-filter (lambda (x) (not(= x (car lst)))) (cdr lst))))))

