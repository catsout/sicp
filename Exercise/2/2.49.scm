(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs) (accumulate op init (cdr seqs)))))
(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))
(define (add-vect . vects)
  (define (add-vect-two v1 v2)
    (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2))))
  (accumulate add-vect-two (list 0 0) vects))
(define (sub-vect . vects)
  (define (sub-vect-two v1 v2)
    (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2))))
  (accumulate sub-vect-two (list 0 0) vects))
(define (scale-vect s vect)
  (make-vect (* s (xcor-vect vect)) (* s (ycor-vect vect))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (scale-vect (xcor-vect v) (edge1-frame frame))
      (scale-vect (ycor-vect v) (edge2-frame frame)))))

(define (make-segment start-v end-v)
  (list start-v end-v))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cadr segment))
(define draw-line $line)
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

(define %bord
  (segments->painter
   (list
    (make-segment (make-vect 0 0) (make-vect 0 1))
    (make-segment (make-vect 0 0) (make-vect 1 0))
    (make-segment (make-vect 1 1) (make-vect 0 1))
    (make-segment (make-vect 1 1) (make-vect 1 0)))))
(%bord (make-frame (make-vect 0.25 0.25) (make-vect 0.5 0) (make-vect 0 0.5)))

(define %rhombus
  (segments->painter
   (list
    (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
    (make-segment (make-vect 0.5 0) (make-vect 0 0.5))
    (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
    (make-segment (make-vect 0.5 1) (make-vect 0 0.5)))))
(%rhombus (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))


