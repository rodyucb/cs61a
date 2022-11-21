(define (over-or-under num1 num2) 
    (if (< num1 num2)
        -1 
        (if (= num1 num2)
            0 1
        )
    )
)

(define (make-adder num)
    (lambda (inc) (+ num inc)))

(define (composed f g) 
    (lambda (x) (f (g x))))

(define (square n) (* n n))

(define (pow base exp) 
    (if (= exp 0) 
        1 
        (if (even? exp) 
            (square (pow base (quotient exp 2))) 
            (if (odd? exp) 
                (* base (square (pow base (quotient exp 2))))
            )
        )
    )
)