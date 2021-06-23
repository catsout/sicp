#!/bin/scheme --script

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (mk) (dot-product v mk)) m))
(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mk) (map (lambda (ck) (dot-product mk ck)) cols)) m)))

(display (dot-product (list 1 3) (list 2 3)))
(newline)

(define m1 (list (list 1 2 0) (list 0 1 0) (list 0 0 1)))

(display m1)
(newline)
(display (matrix-*-vector m1 (list 1 2 3)))
(newline)
(display (transpose m1))
(newline)
(display (matrix-*-matrix m1 m1))

