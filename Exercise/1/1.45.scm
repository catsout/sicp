#!/bin/scheme --script

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (lambda (x)
	    ((compose f (repeated f (- n 1))) x))))

(define (fixed-point f first-guess)
  (define (close-enough? a b)
	  (< (abs (- a b)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))

(define (power x n)
  (if (= n 0)
    1
    (* x (power x (- n 1)))))

(define (square-root x n)
  (define (f y)
    (/ x (power y (- n 1))))
  (define (find-avg-num n)
    (define (find i)
      (if (> (power 2 i) n)
        (- i 1)
        (find (+ i 1))))
    (find 0))
  (fixed-point ((repeated average-damp (find-avg-num n)) f)
               1.0))

#|
1 2-3
2 4-7
3 8-15
4 16-31
n 2^n-2^(n+1)
|#

(display (square-root 100 5))
