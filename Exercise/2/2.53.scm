#!/bin/scheme --script

(display (list 'a 'b 'c))
(newline)

(display (list (list 'george)))

(newline)
(display (cdr '((x1 x2) (+ 1 1))))

(newline)
(display (cadr '((x1 x2) (+ 1 2))))

(newline)
(display (pair? (car '(a short list))))

(newline)
(display (memq 'red '((red shoeds) (blue socks))))

(newline)
(display (memq 'red '(red shoes blue socks)))
