#!/bin/scheme --script

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                                 (cond ((null? x) 0)
                                       ((number? x) 1)
                                       (else (count-leaves x)))) 
                               t))) 
(define x (cons (list 1 2) (list 3 5)))
(display (count-leaves (list x x)))
