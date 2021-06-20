#!/bin/scheme --script

(define (fixed-point f first-guess)
  (define (close-enough? a b)
	(< (abs (- a b)) 0.00001))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

(display (fixed-point cos 1.0))

(define (average a b)
	(/ (+ a b) 2.0))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(newline)
(display (sqrt 2))

(newline)
(display (fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0))
