#!/bin/scheme --script
(define (make-accumulator sum)
  (lambda (x)
	(begin (set! sum (+ sum x)) sum)))

(define A (make-accumulator 5))

(display (A 10))
(display (A 20))
