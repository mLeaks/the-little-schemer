#lang racket

(require rackunit)

(provide atom?)

(define (atom? a)
  (and (not (pair? a)) (not (null? a))))

(check-true
  (atom? 3))
(check-true
  (atom? 3.14))
(check-true
  (atom? "Hello, World!"))

(check-false
  (atom? '()))
(check-false
  (atom? '(1 2 3)))

