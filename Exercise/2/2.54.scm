#!/bin/scheme --script

(define (equal? seq1 seq2)
  (cond ((and (null? seq1) (null? seq2)) #t)
        ((or (null? seq1) (null? seq2)) #f)
        (else (if (eq? (car seq1) (car seq2))
                  (equal? (cdr seq1) (cdr seq2))
                  #f))))

(display (equal? '(this is a list) '(this is a)))
(newline)
(display (equal? '(this is a list) '(this (is a) list)))

(car '(quote abrcadabra))
