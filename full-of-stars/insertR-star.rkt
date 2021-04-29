#lang racket

(require test-engine/racket-tests "../atom.rkt")

; S-expr S-expr List -> List

(define (insertR* new old l)
  (cond
    ((null? l) '())
    ((atom? (car l))
     (cond
       ((eq? (car l) old) 
        (cons old (cons new (insertR* new old (cdr l)))))
       (else
         (cons (car l) (insertR* new old (cdr l))))))
    (else
      (cons (insertR* new old (car l))
            (insertR* new old (cdr l))))))

(check-expect
  (insertR* 
    'roast 
    'chuck
    '((how much (wood)) 
      could 
      ((a (wood) chuck)) 
      (((chuck))) 
      (if (a) ((wood chuck))) 
      could chuck wood))
  '((how much (wood))
    could
    ((a (wood) chuck roast))
    (((chuck roast)))
    (if (a) ((wood chuck roast))
      could chuck roast wood)))
