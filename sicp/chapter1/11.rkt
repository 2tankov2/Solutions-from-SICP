#lang racket/base

(require rackunit)

(define (f n)
   (cond ((< n 3) n)
         (else (+ (f(- n 1)) (f(- n 2)) (f(- n 3))))))


(define (f-i n)
  (f-iter 2 1 0 n))
(define (f-iter a b c count)
  (cond ((= count 0) c)
      ((> count 0) (f-iter (+ a b c) a b (- count 1)))))


(check-equal? (f 1) 1)
(check-equal? (f 2) 2)
(check-equal? (f 3) 3)
(check-equal? (f 4) 6)
(check-equal? (f 5) 11)
(check-equal? (f 6) 20)
(check-equal? (f 7) 37)

(check-equal? (f-i 1) 1)
(check-equal? (f-i 2) 2)
(check-equal? (f-i 3) 3)
(check-equal? (f-i 4) 6)
(check-equal? (f-i 5) 11)
(check-equal? (f-i 6) 20)
(check-equal? (f-i 7) 37)