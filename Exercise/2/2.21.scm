#!/bin/scheme --script

(define (square-list l)
  (map (lambda (x) (* x x)) l))

(display (square-list (list 1 2 3 4 5)))
