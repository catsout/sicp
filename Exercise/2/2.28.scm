#!/bin/scheme --script

(define (fringe t)
  (cond ((null? t) '())
        ((pair? (car t))
         (append (fringe (car t)) (fringe (cdr t))))
        (else
          (cons (car t) (fringe (cdr t))))))

(display (fringe (list (list 1 2) (list (list 3 4) 5))))
