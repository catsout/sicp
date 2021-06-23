#!/bin/scheme --script

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((ng (abs (/ n g)))
        (dg (abs (/ d g))))
      (cond ((and (< n 0) (< d 0)) (cons (* -1 ng) (* -1 dg)))
            ((or (< n 0) (< d 0)) (cons (* -1 ng) dg))
            (else (cons ng dg))))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))
  (newline)


(print-rat (make-rat 20 -120))
