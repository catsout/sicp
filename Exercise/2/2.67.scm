#!/bin/scheme --script

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? obj)
  (eq? 'leaf (car obj)))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols x)
  (if (leaf? x)
    (list (symbol-leaf x))
    (caddr x)))

(define (weight x)
  (if (leaf? x)
    (weight-leaf x)
    (cadddr x)))

(define (make-code-tree left right)
  (list left 
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (decode bits tree)
  (define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
          ((= bit 1) (right-branch branch))
          (else (error "bad bit" bit))))
  (define (decode-1 bits branch)
    (if (or (null? branch) (null? bits))
      '()
      (if (leaf? branch)
        (cons (symbol-leaf branch) (decode-1 (cdr bits) tree))
        (decode-1 (cdr bits) (choose-branch (car bits) branch)))))
  (decode-1 bits tree))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(display (decode sample-message sample-tree))
