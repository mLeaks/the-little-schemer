#lang racket

(require test-engine/racket-tests "../atom.rkt")

; Atom List -> Number
(define (occur* a l)
  (cond
    ((null? l) 0)
    ((atom? (car l)) 
     (cond
       ((eq? (car l) a) (add1 (occur* a (cdr l))))
       (else (occur* a (cdr l)))))
    (else
      (+ (occur* a (car l))
         (occur* a (cdr l))))))

(check-expect 
  (occur* 
    'banana 
    '((banana) 
      (split ((((banana ice))) 
              (cream (banana)) 
              sherbet)) 
      (banana) 
      (bread) 
      (banana brandy))) 
  5)

(check-expect 
  (occur* 
    'apple
    '((banana) 
      (split ((((banana ice))) 
              (cream (banana)) 
              sherbet)) 
      (banana) 
      (bread) 
      (banana brandy))) 
  0)

(test)
