#!/bin/scheme --script

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (element-of-set? x set)
  (cond ((null? set) #f)
		((= x (entry set)) #t)
		((< x (entry set)) (element-of-set? x (left-branch tree)))
		((> x (entry set)) (element-of-set? x (right-branch tree)))))
(define (tree->list-1 tree)
  (if (null? tree)
	'()
	(append (tree->list-1 (left-branch tree))
			(cons (entry tree) (tree->list-2 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree set)
	(if (null? tree)
	  set
	  (copy-to-list (left-branch tree)
					(cons (entry tree) (copy-to-list (right-branch tree) set)))))
  (copy-to-list tree '()))

(define mytree (make-tree 100 
						  (make-tree 2
									 (make-tree 1 '() '())
									 (make-tree 3 '() '())) 
						  (make-tree 110
									 (make-tree 101 '() '())
									 (make-tree 111 '() '())))) 
(display (tree->list-1 mytree))
(newline)
(display (tree->list-2 mytree))
