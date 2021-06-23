#!/bin/scheme --script

(define nil '())
(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (append answer 
                    (cons (square (car things)) nil)))))
  (iter items nil))

(display (square-list (list 1 2 3 4 5)))
