#!/bin/scheme --script

(define (cont-frac n d k)
  (define (cf i)
	(if (> i k)
	  0
	  (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))


(define (cont-frac-iter n d k)
  (define (iter k result)
	(if (= k 0)
	  result
	  (iter (- k 1)
			(/ (n k) (+ (d k) result)))))
  (iter (- k 1) 1.0))

(display (/ 1.0 (cont-frac (lambda (x) 1.0) (lambda (x) 1.0)
		   14)))
(newline)
(display (/ 1.0 (cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0)
		   14)))
