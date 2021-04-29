#lang racket

(provide eqan?)

(require rackunit)

; Atom | Number -> Boolean

(define (eqan? n m)
  (cond
    ((and (number? n) (number? m))
     (= n m))
    ((or (number? n) (number? m))
     #f)
    (else 
      (eq? n m))))

(check-true (eqan? 12 12))
(check-true (eqan? "Hello, World!" "Hello, World!"))

(check-false (eqan? 12 "Hello, World!"))
(check-false (eqan? "Hello, World!" 12))
(check-false (eqan? "Hello, World!" '(Hello, World!)))
(check-false (eqan? '(Hello, World!) "Hello, World!"))

