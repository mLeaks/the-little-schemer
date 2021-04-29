#lang racket

(require test-engine/racket-tests "../atom.rkt")

; List (of S-expr) -> Atom
; finds the leftmost atom in a non-empty list of S-expressions `l`
; that does not contain the empty list.
(define (leftmost l)
  (cond
    ((atom? (car l))
     (car l))
    (else
      (leftmost (car l)))))

(check-expect
  (leftmost '((potato) (chips ((with) fish) (chips))))
  'potato)

(check-expect
  (leftmost '(((hot) (tuna (and))) cheese))
  'hot)

(check-error
  (leftmost '(((() four)) 17 (seventeen))))

(check-error
  (leftmost '()))

(test)

