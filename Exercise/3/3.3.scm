#!/bin/scheme --script


(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (cond ((eq? pass password)
           (cond ((eq? m 'withdraw) withdraw)
                 ((eq? m 'deposit) deposit)
                 (else (error "Unknown request -- MAKE-ACCOUNT" m))))
          (else (error "Incorrect password" pass))))
  dispatch)

(define acc (make-account 100 'abcd))
(display ((acc 'abcd 'withdraw) 50))
(newline)
(display ((acc 'abc 'withdraw) 50))
