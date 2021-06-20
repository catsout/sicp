#!/bin/scheme --script

(define dx 0.00001)
(define (deriv g)
  (lambda (x)
	(/ (- (g (+ x dx)) (g x))
	   dx)))


(define (fixed-point f first-guess)
  (define (close-enough? a b)
	(< (abs (- a b)) 0.00001))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))


(define (newton-transform g)
  (lambda (x)
	(- x (/ (g x)
			((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
	(+ (* x x x)
	   (* a x x)
	   (* b x)
	   c)))

(display (newton-method (cubic 1 1 1) 1.0))
