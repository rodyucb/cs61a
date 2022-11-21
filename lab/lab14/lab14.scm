(define (split-at lst n) 
  (if (= n 0)
    (cons nil lst)
  (if (null? lst) 
    (cons lst nil)
    (cons (cons (car lst) (car (split-at (cdr lst) (- n 1)))) (cdr (split-at (cdr lst) (- n 1)
    )
    )
    )
    )
  )
)



; Tree Abstraction
; Constructs tree given label and list of branches
(define (tree label branches)
  (cons label branches))

; Returns the label of the tree
(define (label t) (car t))

; Returns the list of branches of the given tree
(define (branches t) (cdr t))

; Returns #t if t is a leaf, #f otherwise
(define (is-leaf t) (null? (branches t)))

(define (filter-odd t)
  (cond ((null? t) nil)
    ((even? (label t)) (tree nil (map filter-odd (branches t) )))
    ((odd? (label t)) (tree (label t) (map filter-odd (branches t) ))))) 
    


(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (swap expr) 
  (if (>= (eval (cadr expr)) (eval (caddr expr))) expr
    (cons (car expr) (cons (caddr expr) (cons (cadr expr) (cdr (cddr expr)))))))
