#!/bin/scheme --script

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (fold-right op initial (cdr sequence)))))

(define nil '())
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low height)
  (if (> low height)
    nil
    (cons low (enumerate-interval (+ low 1) height))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


(define (gen-pairs n)
  (let ((nlist (enumerate-interval 1 n)))
    (flatmap (lambda (i) 
               (flatmap (lambda (j)
                          (map (lambda (k) (list i j k)) nlist)) 
                        nlist))
             nlist)))

(define (eq-pairs n s)
   (filter (lambda (pair) (= (+ (car pair) (cadr pair) (caddr pair))  s))
           (gen-pairs n)))

(display (eq-pairs 10 10))
