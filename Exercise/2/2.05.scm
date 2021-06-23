#!/bin/scheme --script

(define (pow x n)
  (if (= n 0)
    1
    (* x (pow x (- n 1)))))

(define (cons a b)
  (* (pow 2 a) (pow 3 b)))

(define (car z)
  (if (= (remainder z 2) 0)
    (+ 1 (car (/ z 2)))
    0))

(define (cdr z)
  (if (= (remainder z 3) 0)
    (+ 1 (car (/ z 3)))
    0))

(define p1 (cons 233 223))
(display (car p1))
(display ",")
(display (cdr p1))
