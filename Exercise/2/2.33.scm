#!/bin/scheme --script

(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define x1 (list 1 2 3 4 5))
(define x2 (list 6 7 8))

(display (map (lambda (x) (* x x)) x1))
(newline)
(display (append x1 x2))
(newline)
(display (length x1))
