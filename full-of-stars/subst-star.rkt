#lang racket

(require "../atom.rkt")

; Atom Atom List (of S-expr) -> List

(define (subst* new old l)
  (cond
    ((null? l) '())
    ((atom? (car l))
     (cond
       ((eq? (car l) old) 
        (cons new (subst* new old (cdr l))))
       (else
         (cons (car l) (subst* new old (cdr l))))))
  (else
    (cons (subst* new old (car l))
          (subst* new old (cdr l))))))


(subst* 'orange 'banana '((banana)
                          (split ((((banana ice banana))) 
                                  (cream (banana)) sherbet))
                          (banana) 
                          (bread) 
                          (banana brandy)))


