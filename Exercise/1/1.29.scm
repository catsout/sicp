#!/bin/scheme  --script

(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a)
	   (sum term (next a) next b))))

(define (sum-integers a b)
  (define (next x) (+ x 1))
  (define (indentity x) x)
  (sum indentity a next b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (integral-xinpu f a b n)
  (let ((h (/ (- b a) n)))
	(define (prenum x)
	  (cond ((or (= x 0) (= x n)) 1)
			((even? x) 2)
			(else 4)))
	(define (yk k)
	  (* (f (+ a (* k h)))
		 (prenum k)))
	(define (inc x) (+ x 1))
	(* (sum yk 0 inc n) (/ h 3.0))))

(define (cube x) (* x x x))

(display (sum-integers 1 100))
(newline)
(display (integral cube 0 1 0.01))
(newline)
(display (integral-xinpu cube 0 1 100))
