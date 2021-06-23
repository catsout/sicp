#!/bin/scheme --script

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))


(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-rectangle up-left width height)
  (cons up-left (cons width height)))

(define (rect-width r)
  (car (cdr r)))
(define (rect-height r)
  (cdr (cdr r)))

(define (rect-perimeter r)
  (* (+ (rect-width r) (rect-height r)) 2))

(define (rect-area r)
  (* (rect-width r) (rect-height r)))

(define rect1 (make-rectangle (make-point 2 2) 4 3))
(display (rect-perimeter rect1))
(newline)
(display (rect-area rect1))
