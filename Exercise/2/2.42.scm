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

(define empty-board '())

(define (safe? k positions)
  (define (safe-two? p1 p2)
    (not (or (= (cadr p1) (cadr p2)) 
             (= (abs (- (car p1) (car p2))) (abs (- (cadr p1) (cadr p2)))))))
  (define (check-from-k k positions)
    (if (or (null? (cdr positions)) (= k 1))
      (cons #t (car positions))
      (let ((result (check-from-k (- k 1) (cdr positions))))
        (if (and (car result) (safe-two? (car positions) (cdr result)))
          result
          (cons #f (cdr result))))))
  (car (check-from-k k positions)))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (list k new-row))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter 
        (lambda (positions) (safe? k positions))
        (flatmap 
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (queens 8))
