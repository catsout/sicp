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

(define (symbol-in-tree? symbol tree)
  (define (symbol-in-list symbol l)
    (cond ((null? l) #f)
          ((eq? symbol (car l)) #t)
          (else (symbol-in-list symbol (cdr l)))))
  (if (leaf? tree)
    (eq? (symbol-leaf tree) symbol)
    (symbol-in-list symbol (symbols tree))))


(define (decode bits tree)
  (define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
          ((= bit 1) (right-branch branch))
          (else (error "bad bit" bit))))
  (define (decode-1 bits branch)
    (cond ((null? branch) '())
          ((leaf? branch)
           (cons (symbol-leaf branch) (decode-1 bits tree)))
          ((null? bits) '())
          (else 
            (decode-1 (cdr bits) (choose-branch (car bits) branch)))))
  (decode-1 bits tree))

(define (encode-symbol symbol tree)
  (define (encode symbol tree)
    (cond ((leaf? tree) '())
          ((symbol-in-tree? symbol (left-branch tree)) 
           (cons 0 (encode symbol (left-branch tree))))
          (else 
           (cons 1 (encode symbol (right-branch tree))))))
  (if (symbol-in-tree? symbol tree)
    (encode symbol tree)
    (error "the symbol is not in tree" symbol)))


(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))


(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(display (decode sample-message sample-tree))
(newline)
(display (encode (decode sample-message sample-tree) sample-tree))
