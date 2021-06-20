#!/bin/scheme --script

(define (iterative-improve good? improve)
  (lambda (guess)
    (if (good? guess)
      guess
      ((iterative-improve good? improve) (improve guess)))))

(define (sqrt x)
  (define (close-enough? a b)
	  (< (abs (- a b)) 0.00001))
  (define (f y)
    (/ (+ y (/ x y)) 2.0))
  (let ((good? (lambda (guess) (close-enough? guess (f guess)))))
    ((iterative-improve good? f) 1.0)))


(define (fixed-point f first-guess)
  (define (close-enough? a b)
	  (< (abs (- a b)) 0.00001))
  (let ((good? (lambda (guess) (close-enough? guess (f guess)))))
    ((iterative-improve good? f) first-guess)))


(display (fixed-point (lambda (y) (/ (+ y (/ 2 y)) 2.0)) 1.0))
(newline)
(display (sqrt 2))
