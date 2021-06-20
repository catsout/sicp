#!/bin/scheme --script


(define (compose f g)
  (lambda (x)
	(f (g x))))

(define (squre x) (* x x))
(define (inc x) (+ x 1))

(display ((compose squre inc) 6))
