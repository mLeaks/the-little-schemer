#lang racket

(provide eqlist?)

(require rackunit "../atom.rkt" "eqan.rkt")

; List List -> Boolean
(define (eqlist? l1 l2)
  (cond
    ((and (null? l1) (null? l2)) #t)
    ((or (null? l1) (null? l2)) #f)
    ((and (atom? (car l1)) (atom? (car l2)))
     (and (eqan? (car l1) (car l2))
          (eqlist? (cdr l1) (cdr l2))))
    ((or (atom? (car l1)) (atom? (car l2))) #f)
    (else
      (and (eqlist? (car l1) (car l2))
           (eqlist? (cdr l1) (cdr l2))))))

(check-true
  (eqlist?
    '(strawberry ice cream)
    '(strawberry ice cream)))

(check-false
  (eqlist?
    '(strawberry ice cream)
    '(strawberry cream ice)))
 
(check-false
  (eqlist?
     '(banana ((split)))
     '((banana (split)))))
 
(check-false
  (eqlist?
    '(beef ((sausage)) (and (soda)))
    '(beef ((salami)) (and (soda)))))

(check-true
  (eqlist?
    '(beef ((sausage)) (and (soda)))
    '(beef ((sausage)) (and (soda)))))

