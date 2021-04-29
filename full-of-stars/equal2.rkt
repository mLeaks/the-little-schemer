#lang racket

(provide equal?)

(require test-engine/racket-tests)
(require "../atom.rkt" "eqan.rkt")

; S-expr S-expr -> Boolean
(define (equal? s1 s2)
  (cond
    ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
    ((or (atom? s1) (atom? s2)) #f)
    (else (eqlist? s1 s2))))

(check-expect
  (equal? '(beef ((sausage)) (and (soda)))
          '(beef ((sausage)) (and (soda))))
  #t)

(check-expect
  (equal? 3.14
          3.14)
  #t)

(check-expect
  (equal? "Hello"
          "Hello")
  #t)

; List List -> Boolean
; #t if each items of both list are equal
; #f otherwise or if the length of `l1` differs from the length of `l2`

(define (eqlist? l1 l2)
  (cond
    ((and (null? l1) (null? l2)) #t)
    ((or (null? l1) (null? l2)) #f)
    (else
      (and (equal? (car l1) (car l2))
           (eqlist? (cdr l1) (cdr l2))))))

(check-expect (eqlist? '() '()) #t)
(check-expect (eqlist? '(a) '()) #f)
(check-expect (eqlist? '() '(a)) #f)
(check-expect (eqlist? '(a) '(a)) #t)
(check-expect (eqlist? '((a) b) '((a) b)) #t)
(check-expect (eqlist? '(a (b)) '(a (b))) #t)
(check-expect (eqlist? '((a b)) '((a) b)) #f)
(check-expect (eqlist? '(()) '()) #f)

(check-expect
  (eqlist?
    '(strawberry ice cream)
    '(strawberry ice cream))
  #t)

(check-expect
  (eqlist?
    '(strawberry ice cream)
    '(strawberry cream ice))
  #f)
 
(check-expect
  (eqlist?
     '(banana ((split)))
     '((banana (split))))
  #f)
 
(check-expect
  (eqlist?
    '(beef ((sausage)) (and (soda)))
    '(beef ((salami)) (and (soda))))
  #f)

(check-expect
  (eqlist?
    '(beef ((sausage)) (and (soda)))
    '(beef ((sausage)) (and (soda))))
  #t)

(test)
