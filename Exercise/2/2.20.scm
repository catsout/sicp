#!/bin/scheme --script

(define (same-parity x . l)
  (define (sp l)
    (if (null? l)
      '()
      (if (= (remainder x 2) (remainder (car l) 2))
        (cons (car l) (sp (cdr l)))
        (sp (cdr l)))))
  (sp l))

(display (same-parity 1 2 3 4 5 6 7 8 9))

