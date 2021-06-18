#!/bin/scheme --script

(define (product term a next b)
  (if (> a b)
	1
	(* (product term (next a) next b)
	   (term a))))

(define (factorial n)
  (define (f k)
	(let ((2k (* 2.0 k)))
	  (/ (* 2k (* 2 (+ k 1))) (* (+ 2k 1) (+ 2k 1)))))
  (define (inc x) (+ x 1))
  (* (product f 1 inc n) 4.0))


(display (factorial 10000))
