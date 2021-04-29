#lang racket

(require test-engine/racket-tests)
(require "../atom.rkt")

; Atom List -> List
; rember removes the first matching atom `a` in `l`

(define (rember* a l)
  (cond
    ((null? l) '())
    ((atom? (car l))
     (cond
       ((eq? (car l) a) (rember* a (cdr l)))
       (else (cons (car l)
                   (rember* a (cdr l))))))
    (else (cons (rember* a (car l))
                (rember* a (cdr l))))))

(check-expect (rember* 'cup
                       '((coffee) cup ((tea) cup) (and (hick)) cup))
                       '((coffee) ((tea)) (and (hick))))

(check-expect (rember* 'sauce
                       '(((tomato sauce))
                         ((bean) sauce)
                         (and ((flying)) sauce)))
                       '(((tomato))
                        ((bean))
                        (and ((flying)))))

(test)
