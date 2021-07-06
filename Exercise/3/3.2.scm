#!/bin/scheme --script

(define (make-monitored f)
  (let ((count 0))
    (lambda (x)
      (cond ((eq? x 'how-many-calls) count)
            (else (set! count (+ count 1))
                  (f x))))))


(define (square x) (* x x))

(define s (make-monitored square))

(display (s 2))
(newline)
(display (s 3))
(newline)
(display (s 'how-many-calls))
