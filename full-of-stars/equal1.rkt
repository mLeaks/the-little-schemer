#lang racket

(require rackunit "../atom.rkt" "eqan.rkt" "eqlist1.rkt")

; S-expr S-expr -> Boolean

(define (equal? s1 s2)
  (cond 
    ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
    ((or (atom? s1) (atom? s2)) #f)
    (else
      (eqlist? s1 s2))))

(check-true
  (equal? '(beef ((sausage)) (and (soda)))
          '(beef ((sausage)) (and (soda)))))

(check-true
  (equal? 3.14
          3.14))

(check-true
  (equal? "Hello"
          "Hello"))

