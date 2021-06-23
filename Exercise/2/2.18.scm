#!/bin/scheme --script

(define (reverse l)
  (define (iter left result)
    (if (null? left)
      result
      (iter (cdr left)
            (cons (car left) result))))
  (iter l (list)))

(display (reverse (list 1 2 3 4 5)))
