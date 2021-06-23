#!/bin/scheme --script

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (fold-right op initial (cdr sequence)))))

(define nil '())
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime? n)
  (define (find-divisor i)
    (cond ((> (* i i) n) #t)
          ((= (remainder n i) 0) #f)
          (else
            (find-divisor (+ i 1)))))
  (find-divisor 2))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (enumerate-interval low height)
  (if (> low height)
    nil
    (cons low (enumerate-interval (+ low 1) height))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

;;----

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j)) 
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(display (prime-sum-pairs 10))
