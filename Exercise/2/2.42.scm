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

