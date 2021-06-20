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

(define (ni k) 1.0)
(define (di k)
  (if (= (remainder k 3) 2)
	(* (/ (+ k 1) 3) 2)
	1))

(display (+ (cont-frac ni di 100) 2))
