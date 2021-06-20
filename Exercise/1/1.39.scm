#!/bin/scheme --script

(define (cont-frac n d k)
  (define (cf i)
	(if (> i k)
	  0
	  (/ (n i) (- (d i) (cf (+ i 1))))))
  (cf 1))

(define (cont-frac-iter n d k)
  (define (iter k result)
	(if (= k 0)
	  result
	  (iter (- k 1)
			(/ (n k) (+ (d k) result)))))
  (iter (- k 1) 1.0))

(define (ni k)
  (if (= k 1)
	k
	(* k k)))

(define (di k) (- (* 2 k) 1))


(define (tan-cf x k)
  (define (ni k)
	(if (= k 1)
	  x
	  (* x x)))
  (define (di k) (- (* 2 k) 1.0))
  (cont-frac ni di 100))


(display (tan-cf 1 300))
