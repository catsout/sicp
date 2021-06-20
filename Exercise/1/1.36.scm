#!/bin/scheme --script

(define (fixed-point f first-guess)
  (define (close-enough? a b)
	(< (abs (- a b)) 0.00001))
  (define (try guess)
	(display guess)
	(newline)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000.0) (log x))) 2.0)
(fixed-point (lambda (x) (/ (+ x (/ (log 1000.0) (log x))) 2.0)) 2.0)
