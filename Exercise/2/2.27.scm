#!/bin/scheme --script

(define (reverse l)
  (define (iter left result)
    (if (null? left)
      result
      (iter (cdr left)
            (cons (car left) result))))
  (iter l (list)))

(define (deep-reverse l)
  (define (iter left result)
    (if (null? left)
      result
      (iter (cdr left)
            (cons (if (pair? (car left))
                    (deep-reverse (car left))
                    (car left)) result))))
  (iter l (list)))

(display (deep-reverse (list 1 2 (list 3 4) 5)))
