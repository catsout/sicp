#!/bin/scheme --script

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (squre x) (* x x))
(define (inc x) (+ x 1))


(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (lambda (x)
	    ((compose f (repeated f (- n 1))) x))))

(display ((repeated squre 2) 5))
