#!/bin/scheme --script

(define (accumulate combiner null-value term a next b)
  (if (> a b)
	null-value
	(combiner
	  (term a)
	  (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) 
			(combiner result (term a)))))
  (iter a null-value))

(define (product term a next b)
  (accumulate-iter * 1 term a next b))

(define (factorial n)
  (define (f k)
	(let ((2k (* 2.0 k)))
	  (/ (* 2k (* 2 (+ k 1))) (* (+ 2k 1) (+ 2k 1)))))
  (define (inc x) (+ x 1))
  (* (product f 1 inc n) 4.0))


(display (factorial 100000))
