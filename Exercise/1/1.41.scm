#!/bin/scheme --script

(define (inc x)
  (+ x 1))
(define (double f)
  (lambda (x)
	(f (f x))))

(display (((double (double double)) inc) 5))

#| 2 4 8 16|#
