#!/bin/scheme --script

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (x y) x)))
(define (cdr z)
  (z (lambda (x y) y)))

(define p1 (cons 0 1))
(display (car p1))
(display ",")
(display (cdr p1))
