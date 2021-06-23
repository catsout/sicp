#!/bin/scheme --script

(define (for-each proc l)
  (cond ((null? l) #t)
        (else
          (proc (car l))
          (for-each proc (cdr l)))))

(for-each (lambda (x) (display x) (newline)) (list 1 2 3 4 5))

