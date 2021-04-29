#lang racket

(require test-engine/racket-tests)
(require "../atom.rkt" "equal2.rkt")

; S-expr List -> List
; rember removes the first matching S-expression `s`
; in `l` (instead of the first matching atom `a` in `l`)
;
; simplified version of rember0.rkt
(define (rember s l)
  (cond
    ((null? l) '())
    (else
      (cond
        ((equal? (car l) s) (cdr l))
        (else (cons (car l)
                    (rember s (cdr l))))))))

(check-expect (rember 'cup
                      '((coffee) cup ((tea) cup) (and (hick)) cup))
                      '((coffee) ((tea) cup) (and (hick)) cup))

(check-expect (rember '((tea) cup)
                      '((coffee) cup ((tea) cup) (and (hick)) cup))
                      '((coffee) cup (and (hick)) cup))

(check-expect (rember 'sauce
                      '(((tomato sauce))
                        ((bean) sauce)
                        (and ((flying)) sauce)))
                      '(((tomato sauce))
                       ((bean) sauce)
                       (and ((flying)) sauce)))

(check-expect (rember '(bean)
                      '(((tomato sauce))
                        ((bean) sauce)
                        (and ((flying)) sauce)))
                      '(((tomato sauce))
                       ((bean) sauce)
                       (and ((flying)) sauce)))

(check-expect (rember '((bean) sauce)
                      '(((tomato sauce))
                        ((bean) sauce)
                        (and ((flying)) sauce)))
                      '(((tomato sauce))
                       (and ((flying)) sauce)))


(test)
