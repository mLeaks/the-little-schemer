#lang scheme

(require test-engine/racket-tests)
(require "../atom.rkt")

; Atom Atom List (of S-expr) -> List

(define (insertL* new old l)
  (cond
    ((null? l) '())
    ((atom? (car l))
     (cond
       ((eq? (car l) old)
        (cons new (cons old (insertL* new old (cdr l)))))
       (else
         (cons (car l) (insertL* new old (cdr l))))))
    (else
      (cons (insertL* new old (car l))
            (insertL* new old (cdr l))))))

(check-expect (insertL* 
                'pecker 
                'chuck 
                '((how much (wood)) 
                  could 
                  ((a (wood) chuck)) 
                  (((chuck))) 
                  (if (a) ((wood chuck))) 
                  could chuck wood))
              '((how much (wood)) 
                could
                ((a (wood) pecker chuck))
                (((pecker chuck)))
                (if (a) ((wood pecker chuck)))
                could pecker chuck wood))

(test)
