#!/bin/scheme --script

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mob)
  (car mob))

(define (right-branch mob)
  (car (cdr mob)))

(define (branch-length bra)
  (car bra))

(define (branch-structure bra)
  (car (cdr bra)))

(define (total-weight mob)
  (define (bra-weight bra)
    (let ((weight (branch-structure bra)))
      (if (number? weight)
        weight
        (total-weight weight))))
  (+ (bra-weight (left-branch mob)) (bra-weight (right-branch))))

(define (balance-mobile? mob)
  (define (weight m)
    (if (number? m)
      m
      (total-weight m)))
  (let ((lwl (* (weight (left-branch mob)) (branch-length (left-branch mob))))
        (rwl (* (weight (right-branch mob)) (branch-length (right-branch mob)))))
    (and (= lwl rwl) (balance-mobile? (left-branch mob)) (balance-mobile? (right-branch mob)))))
