#!/bin/scheme --script

(define (square-tree t)
  (cond ((null? t) '())
        ((number? (car t))
         (cons (* (car t) (car t)) (square-tree (cdr t))))
        (else
          (cons (square-tree (car t)) (square-tree (cdr t))))))

(define (square-tree-m t)
  (map (lambda (x)
         (if (number? x)
           (* x x)
           (square-tree-m x))) t))

(define (tree-map proc l)
  (map (lambda (x)
         (if (number? x)
           (proc x)
           (tree-map proc x))) l))

(define (square-tree-m2 t)
  (tree-map (lambda (x) (* x x)) t))


(display (square-tree-m2 
           (list 1
                 (list 2 (list 3 4) 5
                       (list 6 7)))))
