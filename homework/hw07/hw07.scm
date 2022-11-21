(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (list keys values))

(define (get-keys-kwlist1 kwlist)
  (car kwlist))

(define (get-values-kwlist1 kwlist)
  (car (cdr kwlist)))

(define (make-kwlist2 keys values)
  (if (null? keys) nil
  (cons (list (car keys) (car values)) (make-kwlist2 (cdr keys) (cdr values)))))

(define (get-keys-kwlist2 kwlist) 
  (if (null? kwlist) nil
  (cons (car (car kwlist)) (get-keys-kwlist2 (cdr kwlist)))))


(define (get-values-kwlist2 kwlist)
  (if (null? kwlist) nil
  (cons (car (cdr (car kwlist))) (get-values-kwlist2 (cdr kwlist)))))

(define (add-to-kwlist kwlist key value)
  (make-kwlist (append (get-keys-kwlist kwlist)
  (list key))
  (append (get-values-kwlist kwlist)
  (list value))))

(define (get-first-from-kwlist kwlist key)
  'YOUR-CODE-HERE)

(define (prune-expr expr)
  (define (prune-helper lst) 
    (if (null? lst)
      lst
    (if (null? (cdr lst))
      lst
      (cons (car lst) (prune-helper (cdr (cdr lst)))))))
  (cons (car expr) (prune-helper (cdr expr))))
 

(define (curry-cook formals body) 
  (if (null? (cdr formals))
    (list 'lambda formals body)
    (list 'lambda (list (car formals)) (curry-cook (cdr formals) body))))

(define (curry-consume curries args)
  (if (null? args)
    curries
  (curry-consume (apply curries (list(car args))) (cdr args))))

